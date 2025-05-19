import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  const HomeScreen({Key? key, required this.userData}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Map<String, dynamic> user;

  @override
  void initState() {
    super.initState();
    user = widget.userData;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('user');
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda Sahabat Tani"),
        backgroundColor: const Color(0xFF2D5B33),
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: logout),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        user['profileImage'] != null
                            ? NetworkImage(user['profileImage'])
                            : const AssetImage("assets/petani.png")
                                as ImageProvider,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    "${user['firstName']} ${user['lastName']}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    user['email'],
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                const Divider(height: 32),
                buildInfoTile("Alamat Rumah", user['alamatRumah']),
                buildInfoTile("Alamat Kebun", user['alamatKebun']),
                buildInfoTile("Jenis Tanaman", user['jenisTanaman']),
                buildInfoTile("Luas Lahan", user['luasLahan']),
                buildInfoTile("Hasil Panen", user['hasilPanen']),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoTile(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value?.toString() ?? '-')),
        ],
      ),
    );
  }
}
