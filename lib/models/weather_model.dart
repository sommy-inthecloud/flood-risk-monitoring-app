class WeatherModel {
  final double temperature;
  final int humidity;
  final String description;

  WeatherModel({
    required this.temperature,
    required this.humidity,
    required this.description,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json["main"]["temp"].toDouble(),
      humidity: json["main"]["humidity"],
      description: json["weather"][0]["description"],
    );
  }
}
