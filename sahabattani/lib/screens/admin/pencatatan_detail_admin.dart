import 'package:flutter/material.dart';

class DetailPencatatanPage extends StatelessWidget {
  const DetailPencatatanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pencatatan'),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: const Center(
        child: Text(
          'Detail data pencatatan di sini',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}