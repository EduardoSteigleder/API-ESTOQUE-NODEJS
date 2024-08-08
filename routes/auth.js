const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
require('dotenv').config();

const ACCESS_TOKEN_SECRET = process.env.ACCESS_TOKEN_SECRET;

// Rota para login e gerar token
router.post('/login', (req, res) => {
    const { username, password } = req.body;

    // Aqui você deve validar o usuário e a senha
    // Para fins de exemplo, vamos supor que a validação foi bem-sucedida
    const user = { id: 1, username }; // Exemplo de usuário autenticado

    // Gerar o token JWT
    const token = jwt.sign(user, ACCESS_TOKEN_SECRET, { expiresIn: '1h' });

    res.json({ token });
});

module.exports = router;
