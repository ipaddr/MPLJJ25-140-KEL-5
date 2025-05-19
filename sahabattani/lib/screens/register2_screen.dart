import 'package:flutter/material.dart';

import 'register3_screen.dart'; // tambahkan import ini

class RegisterScreen2 extends StatelessWidget {
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  // Hapus const dari sini
  RegisterScreen2({
    super.key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  final TextEditingController alamatController = TextEditingController();
  final TextEditingController kebunController = TextEditingController();
  final TextEditingController jenisTanamanController = TextEditingController();
  final TextEditingController luasLahanController = TextEditingController();
  final TextEditingController hasilPanenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF7F7FB),
      hintStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header dengan logo dan background hijau
            Container(
              height: 180,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF1E4D2B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(child: Image.asset('assets/logo.png', height: 100)),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Buat Akun',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextField(
                      controller: alamatController,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Alamat Anda',
                        labelText: 'Alamat Rumah',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: kebunController,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Ladang Anda',
                        labelText: 'Alamat Kebun / Ladang',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: jenisTanamanController,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Jenis Tanaman',
                        labelText: 'Jenis Tanaman',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: luasLahanController,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Masukkan Luas Lahan',
                        labelText: 'Luas Lahan',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: hasilPanenController,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Masukkan Hasil Panen Terakhir',
                        labelText: 'Jumlah Hasil Panen Terakhir',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 24),
                    // Navigasi bawah
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Kembali',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.circle,
                              size: 10,
                              color: Color(0xFF1E4D2B),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.circle,
                              size: 10,
                              color: Color(0xFF1E4D2B),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.circle, size: 10, color: Colors.grey),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Kirim data semua ke Register3Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => Register3Screen(
                                      email: email,
                                      firstName: firstName,
                                      lastName: lastName,
                                      password: password,
                                      alamatRumah: alamatController.text,
                                      alamatKebun: kebunController.text,
                                      jenisTanaman: jenisTanamanController.text,
                                      luasLahan: luasLahanController.text,
                                      hasilPanen: hasilPanenController.text,
                                    ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
