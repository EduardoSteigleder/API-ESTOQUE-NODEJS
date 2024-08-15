const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const produtosRouter = require('./routes/produtos');
const movimentacoesRouter = require('./routes/movimentacoes');
const authRouter = require('./routes/auth'); 
const authenticateToken = require('./middleware/authenticateToken');

app.use(bodyParser.json());
app.use('/api/auth', authRouter); 
app.use('/api/produtos', authenticateToken, produtosRouter); 
app.use('/api/movimentacoes', authenticateToken, movimentacoesRouter); 

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
