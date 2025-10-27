import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:project_uas/model/presensiSantriModel.dart';
import 'package:project_uas/model/santriModel.dart';
import 'package:project_uas/viewmodel/santriViewModel.dart';

class PresensiSantriViewModel {
  final SantriViewModel santriViewModel = SantriViewModel();

  Future<List<PresensiSantri>> getPresensiSantri(
    String id_halaqoh,
    String tanggal,
    String jam,
  ) async {
    try {
      // Memuat data presensiSantri.json
      final String presensiResponse = await rootBundle.loadString(
        'assets/data/presensiSantri.json',
      );
      final List<dynamic> presensiData = jsonDecode(presensiResponse);
      List<PresensiSantri> presensiSantriList = presensiData
          .map((item) => PresensiSantri.fromJson(item))
          .toList();

      // Mendapatkan data santri berdasarkan id_halaqoh
      List<Santri> santriList = await santriViewModel.getSantriByHalaqoh(
        id_halaqoh,
      );

      // Filter presensi berdasarkan tanggal dan jam
      List<PresensiSantri> filteredPresensiSantriList = presensiSantriList
          .where(
            (presensi) => presensi.tanggal == tanggal && presensi.jam == jam,
          )
          .toList();

      // Gabungkan data presensi dan santri
      List<PresensiSantri> result = santriList.map((santri) {
        // Cari data presensi yang cocok dengan id_santri
        PresensiSantri? presensi = filteredPresensiSantriList.firstWhere(
          (p) => p.id_santri == santri.id_santri,
          orElse: () => PresensiSantri(
            id_presensi: '',
            id_santri: santri.id_santri,
            nama: santri.nama,
            tanggal: tanggal,
            jam: jam,
            status: '', // Jika tidak ada presensi, kosongkan status
          ),
        );

        // Gabungkan nama santri dan data presensi
        return PresensiSantri(
          id_presensi: presensi.id_presensi,
          id_santri: presensi.id_santri,
          tanggal: presensi.tanggal,
          jam: presensi.jam,
          status: presensi.status,
          nama: santri.nama, // Ambil nama dari santri
        );
      }).toList();

      return result;
    } catch (e) {
      print('Error loading data: $e');
      return [];
    }
  }
}
