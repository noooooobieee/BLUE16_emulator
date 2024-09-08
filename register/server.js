const express = require('express');
const app = express();
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

mongoose.connect('mongodb://localhost/blue16', { useNewUrlParser: true, useUnifiedTopology: true });

const User = mongoose.model('User', {
	username: String,
	email: String,
	password: String,
	approved: Boolean
});

app.use(express.json());

app.post('/register', (req, res) => {
	const { username, email, password } = req.body;

	// Hash the password
	bcrypt.hash(password, 10, (err, hash) => {
		if (err) {
			return res.status(500).json({ error: 'An error occurred. Please try again.' });
		}

		const user = new User({
			username,
			email,
			password: hash,
			approved: false
		});

		user.save((err) => {
			if (err) {
				return res.status(500).json({ error: 'An error occurred. Please try again.' });
			}

			res.json({ message: 'User created successfully. Please wait for approval.' });
		});
	});
});

app.get('/approve/:id', (req, res) => {
	const id = req.params.id;

	User.findById(id, (err, user) => {
		if (err) {
			return res.status(404).json({ error: 'User not found' });
		}

		user.approved = true;
		user.save((err) => {
			if (err) {
				return res.status(500).json({ error: 'An error occurred. Please try again.' });
			}

			res.json({ message: 'User approved successfully' });
		});
	});
});

app.get('/home', (req, res) => {
	res.sendFile(__dirname + '/home.html');
});

app.listen(3000, () => {
	console.log('Server started on port 3000');
});
