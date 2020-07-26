const router = require('express').Router();
const { getAllUsers, saveOneUser, getOneUserById } = require('../controllers/user.controller');
const {authenticateWithJwt, authenticateWithJsonWebToken} = require('../services/jwt');

router.get('/', authenticateWithJwt, getAllUsers, (req, res) => {
  return res.status(200).json(req.users);
});

// router.get('/', authenticateWithJsonWebToken, getAllUsers, (req, res) => {
//   return res.status(200).json(req.users);
// });

router.post('/', saveOneUser, getOneUserById, (req, res) => {
  return res.status(201).json(req.user);
});

module.exports = router;
