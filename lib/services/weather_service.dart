import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather(double lat, double lon) async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}?lat=$lat&lon=$lon&appid=${ApiConstants.apiKey}&units=metric",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherModel.fromJson(json);
    } else {
      throw Exception("Failed to load weather");
    }
  }
}
