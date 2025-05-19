import 'package:flutter/material.dart';
import 'package:sahabattani/screens/login_screen.dart';
import 'package:sahabattani/widgets/user_top_nav.dart';

class PengaturanUser extends StatelessWidget {
  const PengaturanUser({super.key});

  void _keluarAkun(BuildContext context) {
    // Arahkan ke login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E5E2B),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Pastikan logo ini tersedia
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text(
              'Program Produktivitas\nLahan Pertanian',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const UserTopNav(activeMenu: 'pengaturan'),
          Container(
            width: double.infinity,
            color: const Color(0xFF4CAF50),
            padding: const EdgeInsets.all(12),
            child: const Text(
              'PENGATURAN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                const Divider(height: 1),
                const ListTile(
                  title: Text(
                    'Profil',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const Divider(height: 1),
                const ListTile(
                  title: Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const Divider(height: 1),
                const ListTile(
                  title: Text(
                    'Bantuan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => _keluarAkun(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Keluar Akun',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
