const express = require('express');
const cors = require('cors');
require('dotenv').config();

const authRoutes = require('./routes/authRoutes');
const sequelize = require('./config/database');
const User = require('./models/User');

const app = express();
app.use(cors());
app.use(express.json());
app.use('/api/auth', authRoutes);

sequelize.sync().then(() => console.log('Banco sincronizado'));

module.exports = app;
