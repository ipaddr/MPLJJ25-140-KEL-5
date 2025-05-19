import 'dart:async';

import 'package:flutter/material.dart';

import 'confirm_password_screen.dart'; // <-- Import layar tujuan

class VerificationPasswordScreen extends StatefulWidget {
  final String email;

  const VerificationPasswordScreen({Key? key, required this.email})
    : super(key: key);

  @override
  State<VerificationPasswordScreen> createState() =>
      _VerificationPasswordScreenState();
}

class _VerificationPasswordScreenState
    extends State<VerificationPasswordScreen> {
  Timer? _timer;
  int _secondsRemaining = 10;
  bool _isTimerFinished = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          _isTimerFinished = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(1, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: TopClipper(),
              child: Container(
                color: const Color(0xFF2D5B33),
                height: 260,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo.png', height: 100),
                      const SizedBox(height: 12),
                      const Text(
                        "SAHABAT PETANI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "MENUJU PETANI YANG SEJAHTERA",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Confirm Your Email",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text.rich(
                TextSpan(
                  text: "Kami telah mengirimkan kode verifikasi 5 digit ke ",
                  style: const TextStyle(color: Colors.black54),
                  children: [
                    TextSpan(
                      text: widget.email,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText:
                      _isTimerFinished
                          ? "Masukkan Password Baru"
                          : "Resend in ${_formatTime(_secondsRemaining)}",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D5B33),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_isTimerFinished) {
                    // Tombol saat waktu habis (kirim ulang)
                    setState(() {
                      _secondsRemaining = 10;
                      _isTimerFinished = false;
                      _startCountdown();
                    });
                  } else {
                    // Verifikasi berhasil, lanjut ke halaman ubah password
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConfirmPasswordScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  _isTimerFinished
                      ? "Kirim Ulang Kode Verifikasi"
                      : "Verifikasi dan Tetapkan Kata Sandi Baru",
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
