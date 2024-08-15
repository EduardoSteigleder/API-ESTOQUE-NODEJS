const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
require('dotenv').config();

const ACCESS_TOKEN_SECRET = process.env.ACCESS_TOKEN_SECRET;


router.post('/login', (req, res) => {
    const { username, password } = req.body;
    const user = { id: 1, username }; 
    const token = jwt.sign(user, ACCESS_TOKEN_SECRET, { expiresIn: '1h' });

    res.json({ token });
});

module.exports = router;
