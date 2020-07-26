const User = require('../models/User');
const {createToken} = require('../services/jwt');

function loginUser(req, res, next) {
  const {email, password} = req.body;
  User.getOneByEmailAndPassword(email, password, (err, results) => {
    if (err) {
      res.status(500).json({errorMessage: err.message});
    } else if (results.length === 0) {
      res.status(404).json({errorMessage: "Email or password wrong"});
    } else {
      const token = createToken(results[0]);
      req.user = {id: results[0].id, email: email, password: "hidden"};
      req.token = token;
      next();
    }
  });
}

module.exports = {
  loginUser
}