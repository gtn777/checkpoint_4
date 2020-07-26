const connection = require('../sql.connect.js');

class Blog {
  static getAll(callback) {
    const sql = "SELECT * FROM blogs";
    connection.query(sql, (err, results, fields) => {
      console.log(results);
      callback(err, results);
    });
  }

  static saveOne(blog, callback) {
    const sql = "INSERT INTO blogs SET ?";
    connection.query(sql, blog, (err, results, fields) => {
      callback(err, results);
    });
  }

  static getByOwnerId(id, callback) {
    const sql = "SELECT * FROM blogs WHERE owner_id=?";
    connection.query(sql, id, (err, results, fields) => {
      callback(err, results);
    });
  }
  static getById(id, callback) {
    console.log("id à l'arrivée dans getById : " + id)
    const sql = "SELECT * FROM blogs WHERE id=?";
    connection.query(sql, id, (err, results, fields) => {
      callback(err, results);
    });
  }
  static deleteById(id, callback) {
    console.log("id à l'arrivée dans deleteById : " + id)
    const sql = "DELETE FROM blogs WHERE id=?";
    connection.query(sql, id, (err, results, fields) =>{
      console.log("sortie requete deletebyid");
      console.log(results);
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

module.exports = Blog;