const router = require('express').Router();
const { getAllBlocks, saveOneBlock, getBlocksByArticleId, getBlocksById } = require('../controllers/block.controller.js'); 

// router.get('/', getAllBlocks, (req, res) =>{
//     res.status(201).json(req.blocks);
// });

router.post('/', saveOneBlock, getBlocksById, (req, res) => {
    res.status(201).json(req.blockId);
});

router.get('/:id', getBlocksByArticleId, (req,res) => {
    console.log(req.blocks);
    res.status(201).json(req.blocks)
    console.log(res);
});


module.exports = router;