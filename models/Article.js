const connection = require('../sql.connect.js');

class Article {
  static getAll(callback) {
    const sql = "SELECT * FROM articles";
    connection.query(sql, (err, results, fields) => {
      console.log(results);
      callback(err, results);
    });
  }

  static saveOne(article, callback) {
    const sql = "INSERT INTO articles SET ?";
    connection.query(sql, article, (err, results, fields) => {
      callback(err, results);
    });
  }

  static getByBlogId(id, callback) {
    const sql = "SELECT * FROM articles WHERE blog_id=?";
    connection.query(sql, id, (err, results, fields) => {
      callback(err, results);
    });
  }
  static getById(id, callback) {
    const sql = "SELECT * FROM articles WHERE id=?";
    connection.query(sql, id, (err, results, fields) => {
      callback(err, results);
    });
  }
//   static getOneByEmailAndPassword(email, password, callback) {
//     const sql = "SELECT * FROM blocks WHERE email=? AND password=?";
//     connection.query(sql, [email, password], (err, results, fields) => {
//       callback(err, results);
//     });
//   }
}

module.exports = Article;