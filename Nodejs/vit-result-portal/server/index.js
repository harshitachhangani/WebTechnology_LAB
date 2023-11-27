// server/index.js
const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require('cors');
const dotenv = require('dotenv');

const app = express();
const PORT = process.env.PORT || 5000;

dotenv.config();

// Connect to MongoDB
mongoose.connect("mongodb://localhost:27017/vit_results", { useNewUrlParser: true, useUnifiedTopology: true });

app.use(cors());
app.use(bodyParser.json());

// Define routes
const resultRoutes = require('./routes/resultRoutes');
app.use('/api/results', resultRoutes);

app.listen(PORT, () => console.log(`Server is running on port ${PORT}`));
