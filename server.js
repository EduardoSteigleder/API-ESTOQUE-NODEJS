const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const produtosRouter = require('./routes/produtos');
const movimentacoesRouter = require('./routes/movimentacoes');
const authRouter = require('./routes/auth'); // Adicionando a rota de autenticação
const authenticateToken = require('./middleware/authenticateToken'); // Adicionando o middleware de autenticação

// Configuração do middleware
app.use(bodyParser.json());

// Rotas públicas
app.use('/api/auth', authRouter); // Rota de autenticação

// Rotas protegidas
app.use('/api/produtos', authenticateToken, produtosRouter); // Protege a rota de produtos
app.use('/api/movimentacoes', authenticateToken, movimentacoesRouter); // Protege a rota de movimentações

// Iniciar o servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
