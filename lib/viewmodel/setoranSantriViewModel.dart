import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project_uas/model/quranModel.dart';
import 'package:project_uas/model/setoranSantriModel.dart';
import 'package:project_uas/viewmodel/quranViewModel.dart';

class SetoranSantriViewModel {
  Future<List<Setoran>> getSetoranSantriByIdSantri(String id_santri) async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/setoranSantri.json',
      );

      final List<dynamic> data = jsonDecode(response);

      List<Setoran> setoranList = data
          .map((data) => Setoran.fromJson(data))
          .toList();

      List<Setoran> filteredSetoranList = setoranList
          .where((setoran) => setoran.id_santri == id_santri)
          .toList();

      await fetchSurahNames(filteredSetoranList);

      return filteredSetoranList;
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
