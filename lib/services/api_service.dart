import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000/api"; // Django API URL

  // LOGIN FUNCTION
  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login/');
    
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);  // Successful login response
    } else {
      return {"error": jsonDecode(response.body)["error"]}; // Error response
    }
  }

  // REGISTER FUNCTION
  Future<Map<String, dynamic>> register(
      String firstName, String lastName, String username, String email, String password) async {
    final url = Uri.parse('$baseUrl/register/');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "password": password
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Successful registration response
    } else {
      return {"error": jsonDecode(response.body)["error"]}; // Error response
    }
  }
}
