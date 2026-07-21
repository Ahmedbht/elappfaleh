import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../config/api_config.dart';

class AuthService {
  final storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> signup({
    required String email,
    required String password,
    required String fullName,
    String? phone,
    required String accountType, // "business" or "customer"
  }) async {
    final response = await http.post(
      Uri.parse("${ApiConfig.baseUrl}/auth/signup"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
        "full_name": fullName,
        "phone": phone,
        "account_type": accountType,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body)['detail'] ?? "Signup failed");
    }
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    // /auth/login expects form-urlencoded data (OAuth2PasswordRequestForm)
    final response = await http.post(
      Uri.parse("${ApiConfig.baseUrl}/auth/login"),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "username": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['access_token'];
      await storage.write(key: "jwt_token", value: token);
      return token;
    } else {
      throw Exception(jsonDecode(response.body)['detail'] ?? "Login failed");
    }
  }

  Future<String?> getToken() async {
    return await storage.read(key: "jwt_token");
  }

  Future<void> logout() async {
    await storage.delete(key: "jwt_token");
  }
}