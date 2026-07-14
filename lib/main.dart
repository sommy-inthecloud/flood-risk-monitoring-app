import 'package:flutter/material.dart';

import 'constants/app_theme.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const FloodGuardApp());
}

class FloodGuardApp extends StatelessWidget {
  const FloodGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'FloodGuard',

      theme: AppTheme.lightTheme,

      home: const SplashScreen(),
    );
  }
}
