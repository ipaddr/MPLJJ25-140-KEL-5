import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PencatatanUser extends StatefulWidget {
  const PencatatanUser({super.key});

  @override
  State<PencatatanUser> createState() => _PencatatanUserState();
}

class _PencatatanUserState extends State<PencatatanUser> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _tanamanController = TextEditingController();
  final TextEditingController _luasLahanController = TextEditingController();
  final TextEditingController _jumlahPanenController = TextEditingController();

  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Widget _buildNavItem(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          decoration:
              isSelected ? TextDecoration.underline : TextDecoration.none,
          color: isSelected ? const Color(0xFF2D4D3A) : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Program Produktivitas Lahan Pertanian',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: const Color(0xFF2D4D3A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menu Navigasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem("Dashboard", false, () {
                  Navigator.pushReplacementNamed(context, '/dashboard');
                }),
                _buildNavItem("Pencatatan", true, () {
                  // sudah di halaman ini, bisa biarkan kosong atau refresh
                }),
                _buildNavItem("Penyuluhan", false, () {
                  Navigator.pushReplacementNamed(context, '/penyuluhan');
                }),
                _buildNavItem("Pengaturan", false, () {
                  Navigator.pushReplacementNamed(context, '/pengaturan');
                }),
              ],
            ),
            const SizedBox(height: 20),

            const Center(
              child: Text(
                'PENCATATAN',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D4D3A),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tambah Foto
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF8ABF69),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    _selectedImage == null
                        ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Tambah Foto",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                        : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
              ),
            ),
            const SizedBox(height: 20),

            // Tanggal
            const Text("Tanggal"),
            TextField(
              controller: _tanggalController,
              decoration: InputDecoration(
                hintText: 'DD/MM/YY',
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),

            // Tanaman
            const Text("Tanaman"),
            TextField(
              controller: _tanamanController,
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Luas Lahan
            const Text("Luas Lahan"),
            TextField(
              controller: _luasLahanController,
              decoration: InputDecoration(
                suffixText: "ha",
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Jumlah Panen
            const Text("Jumlah Panen"),
            TextField(
              controller: _jumlahPanenController,
              decoration: InputDecoration(
                suffixText: "kg",
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),

            // Tombol Simpan
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Simpan data pencatatan hasil pertanian
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D4D3A),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Simpan", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
