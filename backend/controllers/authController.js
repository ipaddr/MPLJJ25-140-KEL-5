const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const multer = require('multer');
const path = require('path');

// Konfigurasi penyimpanan untuk foto profil
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/'); // folder untuk menyimpan gambar
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  }
});

const upload = multer({ storage: storage });

const register = async (req, res) => {
  const { name, email, password, homeAddress, farmAddress, plantType, landSize, harvestResult } = req.body;

  try {
    const existingUser = await User.findOne({ email });
    if (existingUser) return res.status(400).json({ message: 'Email already registered' });

    const hashedPassword = await bcrypt.hash(password, 10);

    const user = new User({
      name,
      email,
      password: hashedPassword,
      homeAddress,
      farmAddress,
      plantType,
      landSize,
      harvestResult,
      profileImage: "" // awalnya kosong, nanti bisa di-update lewat endpoint upload
    });

    await user.save();
    res.status(201).json({ message: 'User registered successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Registration failed', error });
  }
};

const login = async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.findOne({ email });
    if (!user) return res.status(404).json({ message: 'User not found' });

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) return res.status(400).json({ message: 'Invalid credentials' });

    const token = jwt.sign({ id: user._id }, 'your_jwt_secret', { expiresIn: '1d' });
    res.json({ token, user });
  } catch (error) {
    res.status(500).json({ message: 'Login failed', error });
  }
};

const resetPassword = async (req, res) => {
  const { email, newPassword } = req.body;

  try {
    const user = await User.findOne({ email });
    if (!user) return res.status(404).json({ message: 'User not found' });

    const hashedPassword = await bcrypt.hash(newPassword, 10);
    user.password = hashedPassword;

    await user.save();
    res.json({ message: 'Password updated successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Reset password failed', error });
  }
};

// Dummy endpoint login sosial
const socialLogin = async (req, res) => {
  const { email, name } = req.body;

  try {
    let user = await User.findOne({ email });

    if (!user) {
      user = new User({ email, name, password: '', homeAddress: '', farmAddress: '', plantType: '', landSize: '', harvestResult: '', profileImage: '' });
      await user.save();
    }

    const token = jwt.sign({ id: user._id }, 'your_jwt_secret', { expiresIn: '1d' });
    res.json({ token, user });
  } catch (error) {
    res.status(500).json({ message: 'Social login failed', error });
  }
};

// Upload foto profil
const uploadProfileImage = [
  upload.single('profileImage'),
  async (req, res) => {
    try {
      const userId = req.body.userId;
      const user = await User.findById(userId);
      if (!user) return res.status(404).json({ message: 'User not found' });

      user.profileImage = req.file.path;
      await user.save();

      res.json({ message: 'Profile image uploaded', profileImage: req.file.path });
    } catch (error) {
      res.status(500).json({ message: 'Upload failed', error });
    }
  }
];

module.exports = {
  register,
  login,
  resetPassword,
  socialLogin,
  uploadProfileImage
};
