import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(Icons.person_add, size: 80, color: AppColors.primary),

            const SizedBox(height: 20),

            const Text("Create Account", style: AppTextStyles.heading),

            const SizedBox(height: 10),

            const Text(
              "Join FloodGuard and stay informed",
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 35),

            TextField(
              decoration: const InputDecoration(
                labelText: "Full Name",
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              decoration: const InputDecoration(
                labelText: "Email Address",
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 15),

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

              child: const Text("CREATE ACCOUNT", style: AppTextStyles.button),
            ),
          ],
        ),
      ),
    );
  }
}
