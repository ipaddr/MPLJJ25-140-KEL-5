import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/user/dashboard_user.dart';
import 'screens/user/pencatatan_user.dart';
import 'screens/user/pengaturan_user.dart';
import 'screens/user/penyuluhan_user.dart';
import 'theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return MaterialApp(
      title: 'Pencatatan Hasil Pertanian',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),

      // ✅ Tambahkan daftar route-nya di sini:
      routes: {
        '/dashboard': (context) => DashboardUser(),
        '/pencatatan': (context) => const PencatatanUser(),
        '/penyuluhan': (context) => const PenyuluhanUser(),
        '/pengaturan': (context) => const PengaturanUser(),
      },
    );
  }
}
