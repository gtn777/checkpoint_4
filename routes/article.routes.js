const router = require('express').Router();
const { getAllArticles, saveOneArticle, getArticlesByBlogId, getArticlesById } = require('../controllers/article.controller.js'); 

router.get('/', getAllArticles, (req, res) =>{
    res.status(201).json(req.articles);
});

router.post('/', saveOneArticle, getArticlesById, (req, res) => {
    res.status(201).json(req.articleId);
});

router.get('/:id', getArticlesByBlogId, (req,res) => {
    res.status(201).json(req.articles)
});


module.exports = router;