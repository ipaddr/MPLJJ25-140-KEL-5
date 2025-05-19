import 'package:flutter/material.dart';

import 'dashboard_admin.dart';
import 'penyuluhan1_admin.dart';

class PencatatanPage extends StatelessWidget {
  const PencatatanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 40),
            const SizedBox(width: 10),
            const Text(
              'Program Produktivitas Lahan Pertanian',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Container(
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  },
                  child: Text('Dashboard'),
                ),
                TextButton(
                  onPressed: () {}, // Sudah di halaman Pencatatan
                  child: Text('Pencatatan'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PenyuluhanPage()),
                    );
                  },
                  child: Text('Penyuluhan'),
                ),
              ],
            ),
          ),
        ),
      ),
      // ...existing code...
      // (Table dan isi tetap)
    );
  }
}
