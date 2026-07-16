import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UploadService {
  final String apiUrl =
      "https://v8bm3n7xwk.execute-api.eu-west-1.amazonaws.com/upload-url";

  Future<String?> uploadImage(
    File image, {
    required String description,
    required String severity,
    required String location,
  }) async {
    final response = await http.post(
      Uri.parse(apiUrl),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode({
        "description": description,

        "severity": severity,

        "location": location,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to create report");
    }

    final data = jsonDecode(response.body);

    final uploadUrl = data["uploadUrl"];

    final fileName = data["fileName"];

    final uploadResponse = await http.put(
      Uri.parse(uploadUrl),

      headers: {"Content-Type": "image/jpeg"},

      body: await image.readAsBytes(),
    );

    if (uploadResponse.statusCode == 200) {
      return fileName;
    }

    throw Exception("Image upload failed");
  }
}
