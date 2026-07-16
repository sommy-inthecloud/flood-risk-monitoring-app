import 'package:flutter/material.dart';

import '../map/map_screen.dart';
import '../report/report_screen.dart';
import '../profile/profile_screen.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';
import '../../services/location_service.dart';

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

// ================= HOME SCREEN =================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WeatherModel> weather;

  String floodRisk = "Calculating...";

  String riskProbability = "";

  @override
  void initState() {
    super.initState();

    getLocationWeather();
  }

  Future<void> getLocationWeather() async {
    final position = await LocationService().getCurrentLocation();

    setState(() {
      weather = WeatherService().getWeather(
        position.latitude,

        position.longitude,
      );
    });
  }

  void calculateFloodRisk(WeatherModel data) {
    if (data.humidity >= 85) {
      floodRisk = "HIGH RISK";

      riskProbability = "85% probability based on current conditions";
    } else if (data.humidity >= 60) {
      floodRisk = "MEDIUM RISK";

      riskProbability = "65% probability based on current conditions";
    } else {
      floodRisk = "LOW RISK";

      riskProbability = "30% probability based on current conditions";
    }
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

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Icon(Icons.water_drop, color: Colors.white, size: 40),

                    const SizedBox(height: 15),

                    const Text(
                      "Flood Risk Status",

                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      floodRisk,

                      style: const TextStyle(
                        color: Colors.white,

                        fontSize: 28,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      riskProbability,

                      style: const TextStyle(color: Colors.white70),
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
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Text("Unable to load weather");
                  }

                  final data = snapshot.data!;

                  calculateFloodRisk(data);

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

              const SizedBox(height: 20),

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
