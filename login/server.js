app.post('/login', (req, res) => {
	const { username, password } = req.body;

	User.findOne({ username }, (err, user) => {
		if (err) {
			return res.status(500).json({ error: 'An error occurred. Please try again.' });
		}

		if (!user) {
			return res.status(401).json({ error: 'Invalid username or password' });
		}

		bcrypt.compare(password, user.password, (err, isMatch) => {
			if (err) {
				return res.status(500).json({ error: 'An error occurred. Please try again.' });
			}

			if (!isMatch) {
				return res.status(401).json({ error: 'Invalid username or password' });
			}

			if (!user.approved) {
				return res.status(401).json({ error: 'Your account is not approved yet.' });
			}

			res.json({ message: 'Login successful' });
		});
	});
});
