// server/routes/resultRoutes.js
const express = require('express');
const router = express.Router();
const Result = require('../models/Result');

// Add result
router.post('/', async (req, res) => {
  try {
    const result = new Result(req.body);
    await result.save();
    res.status(201).json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
