const Article = require('../models/Article');

function getAllArticles(req, res, next) {
  Article.getAll((err, results) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else if (results.length === 0) {
      res.status(404).json({ errorMessage: "No article found" });
    } else {
      req.articles = results;
      next();
    }
  });
}

function saveOneArticle(req, res, next) {
  Article.saveOne(req.body, (err, results) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else {
      req.articleId = results.insertId;
      next();
    }
  });
}


function getArticlesById(req, res, next) {
    const id = req.articleId;
    Article.getById(id, (err, results) => {
        if (err) {
            res.status(500).json({ errorMessage: err.message });
        } else if (results.length === 0) {
            res.status(404).json({ errorMessage: `Article with id ${id} not found` });
        } else {
            req.body.articles = results;
            next();
        }
    });
}

function getArticlesByBlogId(req, res, next) {
  const id = req.params.id || req.blogId;
  Article.getByBlogId(id, (err, results) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else if (results.length === 0) {
      res.status(404).json({ errorMessage: `Article with blog_id ${id} not found` });
    } else {
      req.articles = results;
      next();
    }
  });
}

module.exports = {
  getAllArticles,
  saveOneArticle,
  getArticlesByBlogId,
  getArticlesById
}