import 'package:flutter/material.dart';
import 'pencatatan_admin.dart';
import 'penyuluhan1_admin.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 30,
            ),
            SizedBox(width: 10),
            Text('Program Produktivitas Lahan Pertanian'),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {}, // Sudah di halaman Dashboard
                  child: Text('Dashboard'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PencatatanPage()),
                    );
                  },
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
          // ...existing code...
        ],
      ),
    );
  }
}