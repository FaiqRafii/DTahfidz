import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:project_uas/model/santriModel.dart';

class SantriViewModel {
  Future<List<Santri>> getSantriByHalaqoh(String id_halaqoh) async {
    final String response = await rootBundle.loadString(
      'assets/data/santri.json',
    );
    print("masuk santri halaqoh ${id_halaqoh}");
    print("after response");

    final List<dynamic> data = jsonDecode(response);
    print("after data");

    List<Santri> santriList = data
        .map((item) => Santri.fromJson(item))
        .toList();

    // Debugging log
    print("Loaded Santri List: $santriList");

    return santriList
        .where((santri) => santri.id_halaqoh == id_halaqoh)
        .toList();
  }
}
