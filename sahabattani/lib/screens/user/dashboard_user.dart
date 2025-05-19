import 'package:flutter/material.dart';
import 'package:sahabattani/widgets/user_top_nav.dart'; // Pastikan path ini sesuai

class DashboardUser extends StatelessWidget {
  final Color greenPrimary = const Color(0xFF2D6B33);
  final Color greenSecondary = const Color(0xFF6FA05E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const UserTopNav(
              activeMenu: 'dashboard', // sesuai dengan definisi widget
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Judul Pencatatan
                    Container(
                      color: greenSecondary,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.note, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Pencatatan Hasil Panen",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Statistik Boxes
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          InfoBox(
                            title: "Produktivitas Lahan",
                            value: "100 Ton",
                          ),
                          InfoBox(
                            title: "Stok Lumbung Pangan",
                            value: "50 Ton",
                          ),
                          WeatherBox(temp: "30°C", condition: "Cerah"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Grafik dan Keterangan
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 120,
                              color: Colors.green[200],
                              child: const Center(
                                child: Text("Grafik Hasil Panen"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 120,
                              color: Colors.green[300],
                              child: const Center(child: Text("Ket :")),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Penyuluhan Digital
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: greenSecondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Penyuluhan Digital",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            ArticleItem(title: "Judul Artikel"),
                            ArticleItem(title: "Judul Artikel"),
                            ArticleItem(title: "Judul Artikel"),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Jadwal Pelatihan
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Jadwal Pelatihan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: greenSecondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: const [
                                ScheduleItem(date: "17 April 2025"),
                                ScheduleItem(date: "28 April 2025"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
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

// Info Box Widget
class InfoBox extends StatelessWidget {
  final String title;
  final String value;

  const InfoBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// Cuaca Box Widget
class WeatherBox extends StatelessWidget {
  final String temp;
  final String condition;

  const WeatherBox({required this.temp, required this.condition});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            temp,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Icon(Icons.wb_sunny, color: Colors.orange),
          Text(condition),
        ],
      ),
    );
  }
}

// Artikel Widget
class ArticleItem extends StatelessWidget {
  final String title;

  const ArticleItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle, size: 8, color: Colors.white),
        const SizedBox(width: 8),
        Expanded(
          child: Text(title, style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

// Jadwal Widget
class ScheduleItem extends StatelessWidget {
  final String date;

  const ScheduleItem({required this.date});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(date, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}
