import 'dart:async';

import 'package:flutter/material.dart';

// Ganti ke halaman tujuan setelah splash
import 'login_screen.dart'; // <- sesuaikan dengan halaman login kamu

class SplashPasswordScreen extends StatefulWidget {
  const SplashPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SplashPasswordScreen> createState() => _SplashPasswordScreenState();
}

class _SplashPasswordScreenState extends State<SplashPasswordScreen> {
  @override
  void initState() {
    super.initState();

    // Timer selama 3 detik, lalu navigasi
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ), // ganti sesuai halaman tujuan
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF1E4D2B,
      ), // warna hijau gelap sesuai gambar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/register_success.png', // <- Ganti sesuai path gambar PNG kamu
              width: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              "Kata Sandi\nDiperbaharui",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
