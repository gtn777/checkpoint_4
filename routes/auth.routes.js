const router = require('express').Router();
const {loginUser} = require('../controllers/login.controller');

router.post('/login', loginUser, (req, res) => {
  return res.status(200).json({user: req.user, token: req.token});
});

module.exports = router;