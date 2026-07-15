import 'package:flutter/material.dart';

import '../map/map_screen.dart';
import '../report/report_screen.dart';
import '../profile/profile_screen.dart';
import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  final screens = const [
    HomeScreen(),

    MapScreen(),

    ReportScreen(),

    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

        backgroundColor: Colors.white,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: "Report"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
// ---------------- HOME SCREEN ----------------

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WeatherModel> weather;

  @override
  void initState() {
    super.initState();

    weather = WeatherService().getWeather("Lagos");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Good Afternoon 👋",

                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text("Chisom", style: TextStyle(fontSize: 20)),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.blue,

                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Icon(Icons.water_drop, color: Colors.white, size: 40),

                    SizedBox(height: 15),

                    Text(
                      "Flood Risk Status",

                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "MEDIUM RISK",

                      style: TextStyle(
                        color: Colors.white,

                        fontSize: 28,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "65% probability based on current conditions",

                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Weather Today",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              FutureBuilder<WeatherModel>(
                future: weather,

                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Unable to load weather"),
                      ),
                    );
                  }

                  final data = snapshot.data!;

                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.cloud,
                        size: 40,
                        color: Colors.blue,
                      ),

                      title: Text(
                        "${data.temperature.toStringAsFixed(1)}°C",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        "Humidity: ${data.humidity}%\n${data.description}",
                      ),
                    ),
                  );
                },
              ),

              const Text(
                "Safety Tips",

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Card(
                child: Padding(
                  padding: EdgeInsets.all(15),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("⚠ Avoid flooded roads"),

                      SizedBox(height: 8),

                      Text("⚠ Monitor weather alerts"),

                      SizedBox(height: 8),

                      Text("⚠ Keep emergency contacts ready"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
