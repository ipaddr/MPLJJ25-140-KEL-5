import 'package:flutter/material.dart';

import 'dashboard_admin.dart';
import 'pencatatan_admin.dart';
import 'penyuluhan1_detail_admin.dart'; // Tambahkan import ini

class PenyuluhanPage extends StatefulWidget {
  const PenyuluhanPage({Key? key}) : super(key: key);

  @override
  _PenyuluhanPageState createState() => _PenyuluhanPageState();
}

class _PenyuluhanPageState extends State<PenyuluhanPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2E7D32),
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 40),
            const SizedBox(width: 10),
            const Text(
              'Program Produktivitas\nLahan Pertanian',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
          child: Column(
            children: [
              Container(
                color: const Color(0xFF4CAF50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Dashboard',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PencatatanPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Pencatatan',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {}, // Sudah di halaman Penyuluhan
                      child: Text(
                        'Penyuluhan',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: _tabController,
                tabs: const [Tab(text: 'Artikel'), Tab(text: 'Pelatihan')],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab Artikel
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    // Daftar artikel di sini
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddArtikelPage()),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text('Tambah Artikel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                  ),
                ),
              ),
            ],
          ),
          // Tab Pelatihan
          Center(child: Text('Tab Pelatihan')),
        ],
      ),
    );
  }
}
