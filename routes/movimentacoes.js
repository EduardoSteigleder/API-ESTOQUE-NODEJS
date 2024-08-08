const express = require('express');
const router = express.Router();
const db = require('../config/db');

// Listar todas as movimentações
router.get('/', (req, res) => {
    const query = 'SELECT * FROM movimentacoes';
    
    db.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({ message: 'Erro ao buscar movimentações', error });
        }
        
        res.status(200).json(results);
    });
});

module.exports = router;
