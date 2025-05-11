import 'package:flutter/material.dart';
import 'package:sahabattani/screens/register2_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color fieldBgColor = const Color(0xFFF5F5F5);
    final OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan logo
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF1E4D2B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              child: Center(child: Image.asset('assets/logo.png', width: 120)),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Buat Akun",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Form Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Email / HP
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email / No Hp Anda"),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukkan Email Anda",
                      prefixIcon: Icon(Icons.mail_outline),
                      filled: true,
                      fillColor: fieldBgColor,
                      border: borderStyle,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Nama Depan
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Nama Depan"),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Nama Depan Anda",
                      filled: true,
                      fillColor: fieldBgColor,
                      border: borderStyle,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Nama Belakang
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Nama Belakang"),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Nama Belakang Anda",
                      filled: true,
                      fillColor: fieldBgColor,
                      border: borderStyle,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Password
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password"),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Masukkan Password anda",
                      prefixIcon: Icon(Icons.lock_outline),
                      filled: true,
                      fillColor: fieldBgColor,
                      border: borderStyle,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Ulangi Password
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Ulangi Password"),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Masukkan Password anda",
                      prefixIcon: Icon(Icons.lock_outline),
                      filled: true,
                      fillColor: fieldBgColor,
                      border: borderStyle,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Page Indicator + Button Selanjutnya
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Indikator 3 bar kecil
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 12,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 12,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen2(),
                        ),
                      );
                    },
                    child: const Text(
                      "Selanjutnya",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
