import 'package:flutter/material.dart';

import '../my_reports/my_reports_screen.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 60)),

            const SizedBox(height: 20),

            const Text(
              "Chisom Anyasodor",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const Text("chisom@example.com"),

            const SizedBox(height: 30),

            // MY REPORTS BUTTON
            Card(
              child: ListTile(
                leading: const Icon(Icons.history, color: Colors.blue),

                title: const Text("My Reports"),

                subtitle: const Text("View submitted flood reports"),

                trailing: const Icon(Icons.arrow_forward_ios),

                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) => const MyReportsScreen(),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.settings),

                title: const Text("Settings"),

                trailing: const Icon(Icons.arrow_forward_ios),

                onTap: () {},
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.info),

                title: const Text("About FloodGuard"),

                trailing: const Icon(Icons.arrow_forward_ios),

                onTap: () {},
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),

                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),

                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,

                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),

                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
