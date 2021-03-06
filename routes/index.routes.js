const router = require('express').Router();
const blockRouter = require('./block.routes');
const articleRouter = require('./article.routes');
const blogRouter = require('./blog.routes');
const userRouter = require('./user.routes');
const authRouter = require('./auth.routes');

const cors = require('cors');
const corsOptions = {
  origin: process.env.CLIENT_APP_URL
};
router.use(cors(corsOptions));


router.use('/block', blockRouter);
router.use('/article', articleRouter);
router.use('/blog', blogRouter);
router.use('/user', userRouter);
router.use('/auth', authRouter);


module.exports = router;