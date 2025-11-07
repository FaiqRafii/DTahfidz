import 'package:flutter/services.dart';

class User {
  final String email;
  final String password;
  final String nama;
  final String id_user;
  final String level;

  User({
    required this.email,
    required this.password,
    required this.nama,
    required this.id_user,
    required this.level,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      nama: json['nama'],
      id_user: json['_id'],
      level: json['level'],
    );
  }
}
