import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/auth_service.dart'; // Atau sesuaikan path-nya
import 'register_success.dart';

class Register3Screen extends StatefulWidget {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String alamatRumah;
  final String alamatKebun;
  final String jenisTanaman;
  final String luasLahan;
  final String hasilPanen;

  const Register3Screen({
    super.key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.alamatRumah,
    required this.alamatKebun,
    required this.jenisTanaman,
    required this.luasLahan,
    required this.hasilPanen,
  });

  @override
  State<Register3Screen> createState() => _Register3ScreenState();
}

class _Register3ScreenState extends State<Register3Screen> {
  late TextEditingController profileImageController;

  @override
  void initState() {
    super.initState();
    profileImageController = TextEditingController();
  }

  @override
  void dispose() {
    profileImageController.dispose();
    super.dispose();
  }

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
                color: Color(0xFF1E4D2B), // Warna hijau tua
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
                    // Tampilkan data yang sudah diinput di step sebelumnya dalam readonly TextField atau Text widget
                    _infoText('Email', widget.email),
                    _infoText('Nama Depan', widget.firstName),
                    _infoText('Nama Belakang', widget.lastName),
                    _infoText('Alamat Rumah', widget.alamatRumah),
                    _infoText('Alamat Kebun', widget.alamatKebun),
                    _infoText('Jenis Tanaman', widget.jenisTanaman),
                    _infoText('Luas Lahan', widget.luasLahan),
                    _infoText('Hasil Panen', widget.hasilPanen),

                    const SizedBox(height: 12),
                    // Input untuk upload gambar profil (contoh, di sini pakai TextField dulu, bisa diganti dengan picker)
                    TextField(
                      controller: profileImageController,
                      decoration: inputDecoration.copyWith(
                        hintText: 'URL Gambar Profil (contoh)',
                        labelText: 'Profile Image',
                      ),
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
                            Icon(
                              Icons.circle,
                              size: 10,
                              color: Color(0xFF1E4D2B),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () async {
                            final userData = {
                              'email': widget.email,
                              'firstName': widget.firstName,
                              'lastName': widget.lastName,
                              'password': widget.password,
                              'alamatRumah': widget.alamatRumah,
                              'alamatKebun': widget.alamatKebun,
                              'jenisTanaman': widget.jenisTanaman,
                              'luasLahan': widget.luasLahan,
                              'hasilPanen': widget.hasilPanen,
                              'profileImage': profileImageController.text,
                            };

                            try {
                              final response = await AuthService.register(
                                userData,
                              );
                              final responseData = json.decode(response.body);

                              if (response.statusCode == 200 &&
                                  responseData['success'] == true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const RegisterSuccess(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      responseData['message'] ??
                                          'Gagal mendaftar',
                                    ),
                                  ),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Terjadi kesalahan: $e'),
                                ),
                              );
                            }
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

  Widget _infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
