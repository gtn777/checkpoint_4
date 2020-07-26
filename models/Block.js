const connection = require('../sql.connect');

class Block {
  static getAll(callback) {
    const sql = "SELECT * FROM blocks";
    connection.query(sql, (err, results, fields) => {
      console.log(results);
      callback(err, results);
    });
  }

  static saveOne(block, callback) {
    const sql = "INSERT INTO blocks SET ?";
    connection.query(sql, block, (err, results, fields) => {
      callback(err, results);
    });
  }

  static getByArticleId(id, callback) {
    const sql = "SELECT * FROM blocks WHERE article_id=?";
    connection.query(sql, id, (err, results, fields) => {
      callback(err, results);
    });
  }
  static getById(id, callback) {
    const sql = "SELECT * FROM blocks WHERE id=?";
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

module.exports = Block;