import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'screens/splash_screen.dart'; // Mengimpor SplashScreen
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
      home: const SplashScreen(), // Awali dengan SplashScreen
    );
  }
}
