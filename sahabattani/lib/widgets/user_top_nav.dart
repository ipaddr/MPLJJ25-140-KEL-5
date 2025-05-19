import 'package:flutter/material.dart';
import 'package:sahabattani/screens/user/dashboard_user.dart';
import 'package:sahabattani/screens/user/pencatatan_user.dart';
import 'package:sahabattani/screens/user/pengaturan_user.dart';
import 'package:sahabattani/screens/user/penyuluhan_user.dart';

class UserTopNav extends StatelessWidget {
  final String activeMenu;

  const UserTopNav({super.key, required this.activeMenu});

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = const TextStyle(fontSize: 14, color: Colors.white);
    TextStyle activeStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      decoration: TextDecoration.underline,
      color: Colors.white,
    );

    return Container(
      color: const Color(0xFF2E5E2B),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (activeMenu != 'dashboard') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardUser()),
                );
              }
            },
            child: Text(
              'Dashboard',
              style: activeMenu == 'dashboard' ? activeStyle : defaultStyle,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (activeMenu != 'pencatatan') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PencatatanUser(),
                  ),
                );
              }
            },
            child: Text(
              'Pencatatan',
              style: activeMenu == 'pencatatan' ? activeStyle : defaultStyle,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (activeMenu != 'penyuluhan') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PenyuluhanUser(),
                  ),
                );
              }
            },
            child: Text(
              'Penyuluhan',
              style: activeMenu == 'penyuluhan' ? activeStyle : defaultStyle,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (activeMenu != 'pengaturan') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PengaturanUser(),
                  ),
                );
              }
            },
            child: Text(
              'Pengaturan',
              style: activeMenu == 'pengaturan' ? activeStyle : defaultStyle,
            ),
          ),
        ],
      ),
    );
  }
}
