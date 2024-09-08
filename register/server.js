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

		const
