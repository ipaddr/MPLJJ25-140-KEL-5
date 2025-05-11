import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman Login setelah splash screen disentuh
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFAF9F6),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF1E4D2B), // warna hijau tua
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Image.asset('assets/logo.png', width: 120),
                  const SizedBox(height: 10),
                  const Text(
                    'SAHABAT PETANI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Menuju Petani Yang Sejahtera',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Image.asset('assets/petani.png', width: 220),
          ],
        ),
      ),
    );
  }
}
