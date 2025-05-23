const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");
const bodyParser = require("body-parser");
const connectDB = require("./config/db"); // import koneksi

dotenv.config();

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Panggil fungsi koneksi database
connectDB();

const authRoutes = require('./routes/authRoutes');
app.use('/api/auth', authRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
