const express = require('express');
const router = express.Router();
const db = require('../config/db'); // Corrigido o caminho para o arquivo de configuração

// Listar todos os produtos
router.get('/', (req, res) => {
    const query = 'SELECT * FROM produtos';
    
    db.query(query, (error, results) => {
        if (error) {
            return res.status(500).json({ message: 'Erro ao buscar produtos', error });
        }
        
        res.status(200).json(results);
    });
});

// Buscar um produto específico pelo ID
router.get('/:id', (req, res) => {
    const produtoId = req.params.id;
    const query = 'SELECT * FROM produtos WHERE id = ?';
    
    db.query(query, [produtoId], (error, results) => {
        if (error) {
            return res.status(500).json({ message: 'Erro ao buscar produto', error });
        }
        
        if (results.length === 0) {
            return res.status(404).json({ message: 'Produto não encontrado' });
        }
        
        res.status(200).json(results[0]);
    });
});

// Criar um novo produto
router.post('/', (req, res) => {
    const { nome, descricao, preco, quantidade } = req.body;
    const query = 'INSERT INTO produtos (nome, descricao, preco, quantidade) VALUES (?, ?, ?, ?)';
    
    db.query(query, [nome, descricao, preco, quantidade], (error, results) => {
        if (error) {
            return res.status(500).json({ message: 'Erro ao adicionar produto', error });
        }
        
        const produtoId = results.insertId;
        
        // Inserir movimentação
        const movimentacaoQuery = 'INSERT INTO movimentacoes (produto_id, tipo, quantidade, descricao, data) VALUES (?, ?, ?, ?, ?)';
        const movimentacaoData = [produtoId, 'entrada', quantidade, 'Produto adicionado', new Date()];

        db.query(movimentacaoQuery, movimentacaoData, (movError) => {
            if (movError) {
                return res.status(500).json({ message: 'Erro ao adicionar movimentação', error: movError });
            }
            
            res.status(201).json({ message: 'Produto adicionado com sucesso', produtoId });
        });
    });
});

// Excluir um produto
router.delete('/:id', (req, res) => {
    const produtoId = req.params.id;
    
    // Obter os dados do produto antes de excluir
    const selectQuery = 'SELECT * FROM produtos WHERE id = ?';
    
    db.query(selectQuery, [produtoId], (selectError, results) => {
        if (selectError) {
            return res.status(500).json({ message: 'Erro ao buscar produto', error: selectError });
        }
        
        if (results.length === 0) {
            return res.status(404).json({ message: 'Produto não encontrado' });
        }
        
        const produto = results[0];
        
        // Adicionar movimentação de saída
        const movimentacaoQuery = 'INSERT INTO movimentacoes (produto_id, tipo, quantidade, descricao, data) VALUES (?, ?, ?, ?, ?)';
        const movimentacaoData = [produtoId, 'saída', produto.quantidade, 'Produto excluído', new Date()];
        
        db.query(movimentacaoQuery, movimentacaoData, (movError) => {
            if (movError) {
                return res.status(500).json({ message: 'Erro ao adicionar movimentação', error: movError });
            }
            
            // Excluir o produto
            const deleteQuery = 'DELETE FROM produtos WHERE id = ?';
            
            db.query(deleteQuery, [produtoId], (deleteError) => {
                if (deleteError) {
                    return res.status(500).json({ message: 'Erro ao excluir produto', error: deleteError });
                }
                
                res.status(200).json({ message: 'Produto excluído com sucesso' });
            });
        });
    });
});

// Atualizar um produto
router.put('/:id', (req, res) => {
    const produtoId = req.params.id;
    const { nome, descricao, preco, quantidade } = req.body;
    
    // Obter os dados atuais do produto antes de atualizar
    const selectQuery = 'SELECT * FROM produtos WHERE id = ?';
    
    db.query(selectQuery, [produtoId], (selectError, results) => {
        if (selectError) {
            return res.status(500).json({ message: 'Erro ao buscar produto', error: selectError });
        }
        
        if (results.length === 0) {
            return res.status(404).json({ message: 'Produto não encontrado' });
        }
        
        const produtoAtual = results[0];
        
        // Atualizar o produto
        const updateQuery = 'UPDATE produtos SET nome = ?, descricao = ?, preco = ?, quantidade = ? WHERE id = ?';
        
        db.query(updateQuery, [nome, descricao, preco, quantidade, produtoId], (updateError) => {
            if (updateError) {
                return res.status(500).json({ message: 'Erro ao atualizar produto', error: updateError });
            }
            
            // Inserir movimentação de atualização
            const movimentacaoQuery = 'INSERT INTO movimentacoes (produto_id, tipo, quantidade, descricao, data) VALUES (?, ?, ?, ?, ?)';
            const movimentacaoData = [produtoId, 'atualizacao', quantidade, `Produto atualizado de ${produtoAtual.quantidade} para ${quantidade}`, new Date()];
            
            db.query(movimentacaoQuery, movimentacaoData, (movError) => {
                if (movError) {
                    return res.status(500).json({ message: 'Erro ao adicionar movimentação', error: movError });
                }
                
                res.status(200).json({ message: 'Produto atualizado com sucesso' });
            });
        });
    });
});

module.exports = router;
