import 'package:flutter/material.dart';
import '../../services/report_service.dart';

class MyReportsScreen extends StatefulWidget {
  const MyReportsScreen({super.key});

  @override
  State<MyReportsScreen> createState() => _MyReportsScreenState();
}

class _MyReportsScreenState extends State<MyReportsScreen> {
  final ReportService reportService = ReportService();

  late Future<List<dynamic>> reports;

  @override
  void initState() {
    super.initState();
    reports = reportService.getReports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Reports")),
      body: FutureBuilder<List<dynamic>>(
        future: reports,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Failed to load reports"));
          }

          final data = snapshot.data!;

          if (data.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assignment_outlined, size: 70, color: Colors.grey),
                  SizedBox(height: 15),
                  Text(
                    "No flood reports yet",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Your submitted reports will appear here",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final report = data[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: report["severity"] == "High"
                        ? Colors.red
                        : report["severity"] == "Medium"
                        ? Colors.orange
                        : Colors.green,
                    child: const Icon(Icons.warning, color: Colors.white),
                  ),
                  title: Text(report["location"] ?? "Unknown"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(report["description"] ?? ""),
                      Text("Severity: ${report["severity"]}"),
                      Text(report["timestamp"] ?? ""),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
