const connection = require('../sql.connect.js');

class User {
  static getAll(callback) {
    const sql = "SELECT * FROM users";
    connection.query(sql, (err, results, fields) => {
      callback(err, results);
    });
  }

  static saveOne(user, callback) {
    const sql = "INSERT INTO users SET ?";
    connection.query(sql, user, (err, results, fields) => {
      callback(err, results);
    });
  }

  static getOneById(id, callback) {
    const sql = "SELECT * FROM users WHERE id=?";
    connection.query(sql, id, (err, results, fields) => {
      callback(err, results);
    });
  }

  static getOneByEmailAndPassword(email, password, callback) {
    const sql = "SELECT * FROM users WHERE email=? AND password=?";
    connection.query(sql, [email, password], (err, results, fields) => {
      callback(err, results);
    });
  }
}

module.exports = User;