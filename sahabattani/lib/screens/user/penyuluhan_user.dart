import 'package:flutter/material.dart';
import 'package:sahabattani/widgets/user_top_nav.dart';

class PenyuluhanUser extends StatelessWidget {
  const PenyuluhanUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E5E2B),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Ganti sesuai path logo kamu
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
          const UserTopNav(activeMenu: 'penyuluhan'),
          Container(
            width: double.infinity,
            color: const Color(0xFF4CAF50),
            padding: const EdgeInsets.all(12),
            child: const Text(
              'PENYULUHAN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Text(
                  'Materi Penyuluhan Hari Ini:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                  '🌱 Topik: Teknik Irigasi Hemat Air\n'
                  '📅 Tanggal: 20 Mei 2025\n'
                  '📍 Lokasi: Balai Penyuluhan Pertanian\n\n'
                  'Deskripsi:\n'
                  'Penyuluhan ini akan membahas berbagai metode irigasi hemat air yang cocok diterapkan di lahan pertanian dengan hasil maksimal dan biaya minimum.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 24),
                Text(
                  '📢 Info Tambahan:\n'
                  '- Bawa alat tulis\n'
                  '- Siapkan pertanyaan yang relevan\n'
                  '- Hadir tepat waktu\n',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
