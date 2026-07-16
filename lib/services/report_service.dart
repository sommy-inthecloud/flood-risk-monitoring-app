import 'dart:convert';
import 'package:http/http.dart' as http;

class ReportService {
  final String apiUrl =
      "https://vmlee6duqa.execute-api.eu-west-1.amazonaws.com/reports";

  Future<List<dynamic>> getReports() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception("Failed to load reports");
  }
}
