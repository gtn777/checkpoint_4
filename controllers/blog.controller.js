const Blog = require('../models/Blog');

function getAllBlogs(req, res, next) {
  Blog.getAll((err, results) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else if (results.length === 0) {
      res.status(404).json({ errorMessage: "No blog found" });
    } else {
      req.blogs = results;
      next();
    }
  });
}

function saveOneBlog(req, res, next) {
  Blog.saveOne(req.body, (err, results) => {
      console.log("Blog.saveOne : " + err);
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else {
      console.log("insert id:" + results.insertId);
      req.blogId = results.insertId;
      next();
    }
  });
}

function deleteBlogById(req, res, next) {
  const id = req.params.id;
  Blog.deleteById(id, (err, results) => {
    if(err){
      res.status(500).json({ errorMessage: err.message })
    } else if( results.affectedRows !== 1 ){
      res.status(404).send(`Blog avec l'id ${id} non trouvé dans la base de données` );
    } else {
      res.status(200).send(`blog avec id ${id} supprimé.` );
    }
  })
}

function getBlogsByOwnerId(req, res, next) {
  const id = req.params.id || req.blogId;
  Blog.getByOwnerId(id, (err, results) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else if (results.length === 0) {
      res.status(404).json({ errorMessage: `Blog with blog_id ${id} not found` });
    } else {
      req.blogs = results;
      next();
    }
  });
}

function getBlogsById(req, res, next) {
    console.log("req.params.id dans getblogsbyid : " + req.params.id);
    const id = req.params.id || req.blogId;
    console.log("id avant envoie de getblogbyid vers bloc.getbyid" + id);
    Blog.getById(id, (err, results) => {
      if (err) {
        res.status(500).json({ errorMessage: err.message });
      } else if (results.length === 0) {
        res.status(404).json({ errorMessage: `Blog with id ${id} not found` });
      } else {
        req.blogs = results;
        next();
      }
    });
  }

module.exports = {
  getAllBlogs,
  saveOneBlog,
  getBlogsByOwnerId,
  getBlogsById,
  deleteBlogById,
}