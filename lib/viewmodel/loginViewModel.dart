import 'package:flutter/services.dart';
import 'package:project_uas/model/userModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginViewModel {
  Future<User?> login(String email, String password) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    Map<String, dynamic> body = {'email': email, 'password': password};

    final response = await http.post(
      Uri.parse('https://dtahfidz-api.vercel.app/login'),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data is Map<String, dynamic>) {
        return User.fromJson(data);
      } else {
        return null;
      }
    }
  }
}
