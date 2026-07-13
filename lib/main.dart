import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'constants/app_colors.dart';


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
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}