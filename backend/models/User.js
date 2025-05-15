const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: String,
  email: { type: String, unique: true },
  password: String,
  alamatRumah: String,
  alamatKebun: String,
  jenisTanaman: String,
  luasLahan: String,
  hasilPanen: String,
  profileImage: String,
}, { timestamps: true });

module.exports = mongoose.model("User", userSchema);
