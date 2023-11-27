// server/models/Result.js
const mongoose = require('mongoose');

const resultSchema = new mongoose.Schema({
  rollNumber: { type: String, required: true },
  name: { type: String, required: true },
  subjects: [
    {
      name: { type: String, required: true },
      mseMarks: { type: Number, required: true },
      eseMarks: { type: Number, required: true },
    },
  ],
});

module.exports = mongoose.model('Result', resultSchema);
