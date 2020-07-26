const router = require('express').Router();
const { authenticateWithJwt } = require("../services/jwt");
const { getAllBlogs, saveOneBlog, getBlogsByOwnerId, getBlogsById, deleteBlogById } = require('../controllers/blog.controller.js'); 

router.get('/', getAllBlogs, (req, res) =>{
    res.status(201).json(req.blogs);
});

router.post('/', saveOneBlog, getBlogsById, (req, res) => {
    res.status(201).json(req.body);
});

router.get('/byowner/:id', authenticateWithJwt, getBlogsByOwnerId, (req,res) => {
    res.status(201).json(req.blogs)
});
router.get('/:id', getBlogsById, (req,res) => {
    res.status(201).json(req.blogs)
});

router.delete('/:id', deleteBlogById, (req, res) => {
    console.log("sortie de deleteBlogId ");
    res.status(201).json(req);
}  )

module.exports = router;