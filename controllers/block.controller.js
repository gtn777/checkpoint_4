const Block = require('../models/Block');

function getAllBlocks(req, res, next) {
  Block.getAll((err, results) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else if (results.length === 0) {
      res.status(404).json({ errorMessage: "No block found" });
    } else {
      res = results;
      req.blocks = results;
      next();
    }
  });
}

function saveOneBlock(req, res, next) {
  Block.saveOne(req.body, (err, results) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else {
      req.blockId = results.insertId;
      next();
    }
  });
}


function getBlocksById(req, res, next) {
    const id = req.blockId;
    Block.getById(id, (err, results) => {
        if (err) {
            res.status(500).json({ errorMessage: err.message });
        } else if (results.length === 0) {
            res.status(404).json({ errorMessage: `Block with id ${id} not found` });
        } else {
            req.body.blocks = results;
            next();
        }
    });
}

function getBlocksByArticleId(req, res, next) {
  const id = req.params.id || req.blogId;
  Block.getByArticleId(id, (err, results) => {
    if (err) {
      res.status(500).json({ errorMessage: err.message });
    } else if (results.length === 0) {
      res.status(404).json({ errorMessage: `Block with blog_id ${id} not found` });
    } else {
      req.blocks = results;
      next();
    }
  });
}

module.exports = {
  getAllBlocks,
  saveOneBlock,
  getBlocksByArticleId,
  getBlocksById
}