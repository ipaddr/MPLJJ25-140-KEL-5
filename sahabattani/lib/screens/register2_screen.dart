import 'dart:io';

import 'package:flutter/foundation.dart'; // untuk kIsWeb
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen2 extends StatefulWidget {
  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  final TextEditingController alamatRumahController = TextEditingController();
  final TextEditingController alamatKebunController = TextEditingController();
  final TextEditingController jenisTanamanController = TextEditingController();
  final TextEditingController luasLahanController = TextEditingController();
  final TextEditingController hasilPanenController = TextEditingController();

  File? _imageFile; // untuk Android/iOS
  Uint8List? _webImage; // untuk Web
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text("Kamera"),
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (pickedFile != null) {
                      if (kIsWeb) {
                        final bytes = await pickedFile.readAsBytes();
                        setState(() {
                          _webImage = bytes;
                          _imageFile = null;
                        });
                      } else {
                        setState(() {
                          _imageFile = File(pickedFile.path);
                          _webImage = null;
                        });
                      }
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text("Galeri"),
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      if (kIsWeb) {
                        final bytes = await pickedFile.readAsBytes();
                        setState(() {
                          _webImage = bytes;
                          _imageFile = null;
                        });
                      } else {
                        setState(() {
                          _imageFile = File(pickedFile.path);
                          _webImage = null;
                        });
                      }
                    }
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset('assets/petani.png', height: 120),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Text(
                "Buat Akun",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),

              buildLabel("Alamat Rumah"),
              buildTextField(
                controller: alamatRumahController,
                hint: "Alamat Anda",
              ),

              buildLabel("Alamat Kebun / Ladang"),
              buildTextField(
                controller: alamatKebunController,
                hint: "Ladang Anda",
              ),

              buildLabel("Jenis Tanaman"),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      controller: jenisTanamanController,
                      hint: "Jenis Tanaman",
                    ),
                  ),
                  SizedBox(width: 12),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),

              if (_webImage != null || _imageFile != null) ...[
                SizedBox(height: 12),
                Center(
                  child:
                      kIsWeb
                          ? Image.memory(
                            _webImage!,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                          : Image.file(
                            _imageFile!,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                ),
              ],

              buildLabel("Luas Lahan"),
              buildTextField(
                controller: luasLahanController,
                hint: "Masukkan Luas Lahan",
              ),

              buildLabel("Jumlah Hasil Panen Terakhir"),
              buildTextField(
                controller: hasilPanenController,
                hint: "Masukkan Hasil Panen Terakhir",
              ),

              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Kembali",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 10, color: Colors.grey),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 10, color: Color(0xFF1C4C2F)),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 10, color: Colors.grey),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Lanjut ke halaman berikutnya
                    },
                    child: Text(
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
    );
  }

  Widget buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xF7F7F9FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
      ),
    );
  }
}
