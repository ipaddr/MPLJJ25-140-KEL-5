import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl =
      "http:// 192.168.137.1:5000/api/auth"; // Ganti IP-nya

  static Future<http.Response> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/login");
    return await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );
  }

  static Future<http.Response> register(Map<String, dynamic> userData) async {
    final url = Uri.parse("$baseUrl/register");
    var request = http.MultipartRequest('POST', url);

    userData.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    if (userData['profileImage'] != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'profileImage',
          userData['profileImage'],
        ),
      );
    }

    var streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }
}
