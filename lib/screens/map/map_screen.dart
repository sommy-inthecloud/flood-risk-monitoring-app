import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flood Risk Map")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Flood Risk Map",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Container(
              height: 300,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map, size: 70, color: Colors.blue),
                    SizedBox(height: 10),
                    Text(
                      "Google Maps Integration\nComing Soon",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Card(
              child: ListTile(
                leading: Icon(Icons.location_on, color: Colors.red),
                title: Text("Current Location"),
                subtitle: Text("Ikeja, Lagos"),
              ),
            ),

            const SizedBox(height: 15),

            const Card(
              child: ListTile(
                leading: Icon(Icons.warning, color: Colors.orange),
                title: Text("Current Flood Risk"),
                subtitle: Text("Medium Risk"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
