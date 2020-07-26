const jwt = require('jsonwebtoken');
const expressJwt = require('express-jwt');

const JWT_SECRET = process.env.JWT_SECRET;

function createToken(user) {
  const token = jwt.sign(
    {id: user.id},
    JWT_SECRET,
    {expiresIn: 500}
  );
  return token;
}

const authenticateWithJwt = expressJwt({
  secret: JWT_SECRET
});

function authenticateWithJsonWebToken(req, res, next) {
  const token = req.headers['authorization'].split(' ')[1];
  console.log(token);
  jwt.verify(token, JWT_SECRET, (err) => {
    if (err) {
      res.status(401).json({errorMessage: "you're not allowed to acces these data"});
    } else {
      next();
    }
  });
} 

module.exports = {
  createToken,
  authenticateWithJwt,
  authenticateWithJsonWebToken
}