// Memuat modul Express.js
const express = require('express');
const app = express(); // Membuat instance aplikasi Express
const port = 3002; // Menetapkan port server
const response = require('./response.js')

// Memuat modul body-parser untuk parsing body dari request HTTP
const bodyParser = require('body-parser');

//pemanggilam file config.js di indexs.js
const db = require('./config.js');
const { error } = require('console');

// Menggunakan body-parser untuk meng-parse body dari request dalam format JSON
app.use(bodyParser.json())
// Get data
app.get('/Customers', (req, res) => {
  db.query('SELECT * FROM customers', function (error, results, fields) {
    if (error) throw error;
    response(200, results, 'data table ...', res);
  });
});

app.get('/Orders', (req, res) => {
  db.query('SELECT * FROM tb_Orders', function (error, results, fields) {
    if (error) throw error;
    response(200, results, 'data table ...', res);
  });
});

app.get('/Menu', (req, res) => {
  db.query('SELECT * FROM tb_Menu', function (error, results, fields) {
    if (error) throw error;
    response(200, results, 'data table penjualan', res);
  });
});

app.get('/Staff', (req, res) => {
  db.query('SELECT * FROM tb_Staff', function (error, results, fields) {
    if (error) throw error;
    response(200, results, 'data table ...', res);
  });
});

// insert data (post)
app.post('/cafe/post', (req, res) => {
  res.send('Ini post data');
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
