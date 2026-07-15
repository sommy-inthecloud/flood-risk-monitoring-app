import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String severity = "Medium";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Report Flood")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Report a Flood Incident",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.photo_camera),
              label: const Text("Upload Flood Image"),
            ),

            const SizedBox(height: 20),

            const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Describe the situation",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: severity,
              decoration: const InputDecoration(
                labelText: "Severity",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: "Low", child: Text("Low")),
                DropdownMenuItem(value: "Medium", child: Text("Medium")),
                DropdownMenuItem(value: "High", child: Text("High")),
              ],
              onChanged: (value) {
                setState(() {
                  severity = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            const TextField(
              decoration: InputDecoration(
                labelText: "Location",
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Flood report submitted successfully!"),
                    ),
                  );
                },
                child: const Text("SUBMIT REPORT"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
