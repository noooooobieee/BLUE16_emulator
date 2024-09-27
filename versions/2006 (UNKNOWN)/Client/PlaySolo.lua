if not game.Players.LocalPlayer then
	game.Players:createLocalPlayer(0)
	game.Players.LocalPlayer:LoadCharacter()
	game:service("RunService"):run()
function onDied(humanoid)
	wait(5);
	game.Players.Player:LoadCharacter(0);
end
game.Players.Player.Character.Humanoid.Died:connect(onDied);
end
