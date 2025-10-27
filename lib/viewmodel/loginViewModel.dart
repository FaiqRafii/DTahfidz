import 'package:flutter/services.dart';
import 'package:project_uas/model/userModel.dart';
import 'dart:convert';

class LoginViewModel {
  Future<List<User>> loadUsers() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/user.json',
      );
      final data = json.decode(response);

      if (data is List) {
        return data.map((userJson) => User.fromJson(userJson)).toList();
      } else {
        throw Exception("Data format tidak sesuai");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> login(String email, String password) async {
    List<User> users = await loadUsers();

    for (var user in users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }
    return null;
  }
}
