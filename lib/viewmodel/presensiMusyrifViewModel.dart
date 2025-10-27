import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project_uas/model/presensiMusyrifModel.dart';

class PresensiMusyrifViewModel {
  Future<List<PresensiMusyrif>> fetchPresensiById(
    String id_user,
    String tanggal,
  ) async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/presensiMusyrif.json',
      );

      List<dynamic> data = jsonDecode(response);

      List<PresensiMusyrif> presensiList = data
          .map((item) => PresensiMusyrif.fromJson(item))
          .toList();

      // Debugging the filtered data
      print(
        'Filtered presensiList: ${presensiList.where((presensi) => presensi.id_user == id_user && presensi.tanggal == tanggal)}',
      );

      return presensiList
          .where(
            (presensi) =>
                presensi.id_user == id_user && presensi.tanggal == tanggal,
          )
          .toList();
    } catch (e) {
      print('Error loading presensi musyrif: ${e}');
      return [];
    }
  }
}
