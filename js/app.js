const express = require('express');
const pool = require('./db');
const app = express();

app.use(express.json());

app.post('/usuarios', async (req, res) => {
  const { nome, email, senha } = req.body;

  try {
    const result = await pool.query(
      'INSERT INTO usuarios (nome, email, senha) VALUES ($1, $2, $3) RETURNING *',
      [nome, email, senha]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ erro: 'Erro ao inserir usuário' });
  }
});

app.listen(3000, () => console.log('Servidor rodando na porta 3000'));
