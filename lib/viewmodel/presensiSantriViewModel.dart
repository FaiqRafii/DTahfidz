import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:project_uas/model/presensiSantriModel.dart';
import 'package:project_uas/model/santriModel.dart';
import 'package:project_uas/view/components/presensiList.dart';
import 'package:project_uas/viewmodel/santriViewModel.dart';
import 'package:http/http.dart' as http;

class PresensiSantriViewModel {
  final SantriViewModel santriViewModel = SantriViewModel();

  Future<String> addPresensiSantri(
    Map<String, ValueNotifier<String>> presensiData,
    String tanggal,
    String jam,
  ) async {
    try {
      List<Map<String, dynamic>> presensiList = [];

      final hasEmpty = presensiData.values.any((v) => v.value.trim().isEmpty);
      if (hasEmpty) return 'status kosong';

      presensiData.forEach((id_santri, statusNotifier) {
        String status = statusNotifier.value;
        presensiList.add({
          'id_santri': id_santri,
          'tanggal': tanggal,
          'jam': jam,
          'status': status,
        });
      });

      final response = await http.post(
        Uri.parse('https://dtahfidz-api.vercel.app/presensi/santri'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(presensiList),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 201) {
        return 'sukses';
      } else {
        return 'eror ${response.body}';
      }
    } catch (e) {
      throw Exception("Error sending presensi santri: $e");
    }
  }

  Future<List<PresensiSantri>> getPresensiSantri(
    String id_halaqoh,
    String tanggal,
    String jam,
  ) async {
    try {
      final presensiResponse = await http.get(
        Uri.parse(
          'https://dtahfidz-api.vercel.app/presensi/santri?id_halaqoh=${id_halaqoh}&tanggal=${tanggal}&jam=${jam}',
        ),
      );
      final List<dynamic> presensiData = jsonDecode(presensiResponse.body);
      List<PresensiSantri> presensiSantriList = presensiData
          .map((item) => PresensiSantri.fromJson(item))
          .toList();

      // Mendapatkan data santri berdasarkan id_halaqoh
      // List<Santri> santriList = await santriViewModel.getSantriByHalaqoh(
      //   id_halaqoh,
      // );

      // Filter presensi berdasarkan tanggal dan jam
      // List<PresensiSantri> filteredPresensiSantriList = presensiSantriList
      //     .where(
      //       (presensi) => presensi.tanggal == tanggal && presensi.jam == jam,
      //     )
      //     .toList();

      // Gabungkan data presensi dan santri
      // List<PresensiSantri> result = santriList.map((santri) {
      //   // Cari data presensi yang cocok dengan id_santri
      //   PresensiSantri? presensi = filteredPresensiSantriList.firstWhere(
      //     (p) => p.id_santri == santri.id_santri,
      //     orElse: () => PresensiSantri(
      //       id_presensi: '',
      //       id_santri: santri.id_santri,
      //       nama: santri.nama,
      //       tanggal: tanggal,
      //       jam: jam,
      //       status: '', // Jika tidak ada presensi, kosongkan status
      //     ),
      //   );

      // Gabungkan nama santri dan data presensi
      //   return PresensiSantri(
      //     id_presensi: presensiSantriList.id_presensi,
      //     id_santri: presensi.id_santri,
      //     tanggal: presensi.tanggal,
      //     jam: presensi.jam,
      //     status: presensi.status,
      //     nama: santri.nama, // Ambil nama dari santri
      //   );
      // }).toList();

      print("Presensi Santri List: ${presensiSantriList.toString()}");
      return presensiSantriList;
    } catch (e) {
      print('Error loading data: $e');
      return [];
    }
  }
}
