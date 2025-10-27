import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project_uas/model/halaqohModel.dart';

class HalaqohViewModel {
  Future<List<Halaqoh>> loadHalaqoh() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/halaqoh.json',
      );

      final data = jsonDecode(response);

      if (data is List) {
        return data
            .map((halaqohJson) => Halaqoh.fromJson(halaqohJson))
            .toList();
      } else {
        throw Exception('Format data tidak sesuai');
      }
    } catch (e) {
      rethrow;
    }
  }
}
