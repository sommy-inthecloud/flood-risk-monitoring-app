import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(Icons.water_drop, size: 80, color: AppColors.primary),

            const SizedBox(height: 20),

            const Text("Welcome Back", style: AppTextStyles.heading),

            const SizedBox(height: 10),

            const Text(
              "Login to continue monitoring flood risks",
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            TextField(
              decoration: const InputDecoration(
                labelText: "Email Address",
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},

              child: const Text("LOGIN", style: AppTextStyles.button),
            ),
          ],
        ),
      ),
    );
  }
}
