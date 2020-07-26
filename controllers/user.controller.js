const User = require('../models/User');

function getAllUsers(req, res, next) {
  User.getAll((err, results) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else if (results.length === 0) {
      res.status(404).json({ errorMessage: "No users found" });
    } else {
      req.users = results;
      next();
    }
  });
}

function saveOneUser(req, res, next) {
  User.saveOne(req.body, (err, results) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else {
      req.userId = results.insertId;
      next();
    }
  });
}

function getOneUserById(req, res, next) {
  const id = req.params.id || req.userId;
  User.getOneById(id, (err, results) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else if (results.length === 0) {
      res.status(404).json({ errorMessage: `User with id ${id} not found` });
    } else {
      req.user = results[0];
      next();
    }
  });
}

module.exports = {
  getAllUsers,
  saveOneUser,
  getOneUserById
}