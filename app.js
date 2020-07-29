const express = require('express');
const app = express();
const router = require('./routes/index.routes');



app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use('/api', router);

module.exports = app;
