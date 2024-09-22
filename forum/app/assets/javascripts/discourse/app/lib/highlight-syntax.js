import DEBUG from "@glimmer/env";
import { waitForPromise } from "@ember/test-waiters";
import mergeHTMLPlugin from "discourse/lib/highlight-syntax-merge-html-plugin";
import { isTesting } from "discourse-common/config/environment";
import { getURLWithCDN } from "discourse-common/lib/get-url";

let _moreLanguages = [];
let _plugins = [];
let hljsLoadPromise;

export default async function highlightSyntax(elem, siteSettings, session) {
  if (!elem) {
    return;
  }

  const selector = siteSettings.autohighlight_all_code
    ? "pre code"
    : "pre code[class]";

  const codeblocks = elem.querySelectorAll(selector);

  if (!codeblocks.length) {
    return;
  }

  const path = session.highlightJsPath;

  const hljs = await ensureHighlightJs(path);

  codeblocks.forEach((e) => {
    // Large code blocks can cause crashes or slowdowns
    if (e.innerHTML.length > 30000) {
      return;
    }

    let lang;
    for (const className of e.classList) {
      const m = className.match(/^lang(?:uage)?-(.+)$/);
      if (m) {
        lang = m[1];
        break;
      }
    }

    if (lang === "auto" && e.innerHTML.length > 1000) {
      return;
    }

    const canHighlight = lang && (lang === "auto" || hljs.getLanguage(lang));

    if (canHighlight) {
      e.classList.remove("lang-auto"); // This isn't a real hljs language. HLJS will warn if it's present, so we remove it.
      hljs.highlightElement(e);
    } else {
      // To make debugging easier, add a data attribute to indicate we skipped it
      e.dataset.unknownHljsLang = lang;
    }
  });
}

async function ensureHighlightJs(langFile) {
  try {
    if (!hljsLoadPromise) {
      hljsLoadPromise = loadHighlightJs(langFile);
      waitForPromise(hljsLoadPromise);
    }
    return await hljsLoadPromise;
  } catch (e) {
    // Allow retry next time
    hljsLoadPromise = null;
    throw e;
  }
}

async function loadHighlightJs(langFile) {
  const [hljsModule, languageInitializer] = await Promise.all([
    import("highlight.js/lib/core"),
    loadLanguageInitializer(langFile),
  ]);

  const hljs = hljsModule.default;

  languageInitializer(hljs);

  initializer(hljs);

  return hljs;
}

async function loadLanguageInitializer(langFile) {
  if (DEBUG && isTesting()) {
    // Rails server is not available. Load up three languages direct from node_modules
    const [javascript, sql, ruby] = await Promise.all([
      import("highlight.js/lib/languages/javascript"),
      import("highlight.js/lib/languages/sql"),
      import("highlight.js/lib/languages/ruby"),
    ]);

    return (hljs) => {
      hljs.registerLanguage("javascript", javascript.default);
      hljs.registerLanguage("ruby", ruby.default);
      hljs.registerLanguage("sql", sql.default);
    };
  }

  // Load site-specific language bundle generated by Rails HighlightJsController
  const url = getURLWithCDN(langFile);
  const module = await import(/* webpackIgnore: true */ url);
  return module.default;
}

export function registerHighlightJSLanguage(name, fn) {
  _moreLanguages.push({ name, fn });
}

export function registerHighlightJSPlugin(plugin) {
  _plugins.push(plugin);
}

function customHighlightJSLanguages(hljs) {
  _moreLanguages.forEach((l) => {
    if (hljs.getLanguage(l.name) === undefined) {
      hljs.registerLanguage(l.name, l.fn);
    }
  });
}

function customHighlightJSPlugins(hljs) {
  _plugins.forEach((p) => {
    hljs.addPlugin(p);
  });
}

function initializer(hljs) {
  customHighlightJSLanguages(hljs);
  customHighlightJSPlugins(hljs);
  hljs.addPlugin(mergeHTMLPlugin);
  hljs.configure({
    ignoreUnescapedHTML: true,
  });
}
