// login_screen.dart
import 'package:flutter/material.dart';
import 'package:sahabattani/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                      // Gambar logo Anda di sini
                      Image.asset(
                        'assets/logo.png', // Ganti dengan path logo Anda
                        height: 100,
                      ),
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

            const SizedBox(height: 20),
            const Text(
              "Login",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Email Anda",
                      prefixIcon: const Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Masukkan Password anda",
                      prefixIcon: const Icon(Icons.lock_outline),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (val) {}),
                      const Text("Remember me"),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Lupa password",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2D5B33),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Sign in"),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("Or Login with"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/facebook.png", height: 32),
                      const SizedBox(width: 16),
                      Image.asset("assets/google.png", height: 32),
                      const SizedBox(width: 16),
                      Image.asset("assets/apple.png", height: 32),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Tidak Punya Akun ? "),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      const RegisterScreen(), // Menuju halaman pendaftaran
                            ),
                          );
                        },
                        child: const Text(
                          "Daftar",
                        ), // Tambahkan Text widget sebagai child dari TextButton
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
