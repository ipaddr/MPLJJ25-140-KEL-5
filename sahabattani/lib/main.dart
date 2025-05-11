// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart'; // App.dart berisi MyApp
import 'providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MyApp(), // Ini diambil dari app.dart
    ),
  );
}
