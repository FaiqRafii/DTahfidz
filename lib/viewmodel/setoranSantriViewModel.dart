import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project_uas/model/quranModel.dart';
import 'package:project_uas/model/setoranSantriModel.dart';
import 'package:project_uas/viewmodel/quranViewModel.dart';
import 'package:http/http.dart' as http;

class SetoranSantriViewModel {
  Future<bool> addSetoran(
    String id_santri,
    String tanggal,
    String jam,
    String id_surah_mulai,
    String ayat_mulai,
    String id_surah_akhir,
    String ayat_akhir,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('https://dtahfidz-api.vercel.app/setoran'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id_santri': id_santri,
          'tanggal': tanggal,
          'jam': jam,
          'id_surah_mulai': id_surah_mulai,
          'ayat_mulai': ayat_mulai,
          'id_surah_akhir': id_surah_akhir,
          'ayat_akhir': ayat_akhir,
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Error sending setoran santri: $e");
    }
  }

  Future<List<Setoran>> getSetoranSantriByIdSantri(String id_santri) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://dtahfidz-api.vercel.app/setoran?id_santri=${id_santri}',
        ),
      );

      final List<dynamic> data = jsonDecode(response.body);

      List<Setoran> setoranList = data
          .map((data) => Setoran.fromJson(data))
          .toList();

      await fetchSurahNames(setoranList);
      print("Setoran list in view model: ${setoranList}");
      return setoranList;
    } catch (e) {
      print('Error loading setoran santri: ${e}');
      return [];
    }
  }

  Future<void> fetchSurahNames(List<Setoran> setoranList) async {
    List<Quran> surahList = await QuranViewModel().fetchData();

    for (var setoran in setoranList) {
      Quran? surahMulai = surahList.firstWhere(
        (surah) => surah.id_surah == setoran.id_surah_mulai,
        orElse: () => Quran(id_surah: '', nama_surah: 'Unknown'),
      );

      Quran? surahAkhir = surahList.firstWhere(
        (surah) => surah.id_surah == setoran.id_surah_akhir,
        orElse: () => Quran(id_surah: '', nama_surah: 'Unknown'),
      );

      setoran.id_surah_mulai = surahMulai.nama_surah;
      setoran.id_surah_akhir = surahAkhir.nama_surah;
    }
  }
}
