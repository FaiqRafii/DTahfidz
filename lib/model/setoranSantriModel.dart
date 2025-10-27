class Setoran {
  final String id_setoran;
  final String id_santri;
  final String tanggal;
  final String waktu;
  String id_surah_mulai;
  final String ayat_mulai;
  String id_surah_akhir;
  final String ayat_akhir;

  Setoran({
    required this.id_setoran,
    required this.id_santri,
    required this.tanggal,
    required this.waktu,
    required this.id_surah_mulai,
    required this.ayat_mulai,
    required this.id_surah_akhir,
    required this.ayat_akhir,
  });

  factory Setoran.fromJson(Map<String, dynamic> json) {
    return Setoran(
      id_setoran: json['id_setoran'],
      id_santri: json['id_santri'],
      tanggal: json['tanggal'],
      waktu: json['waktu'],
      id_surah_mulai: json['id_surah_mulai'],
      ayat_mulai: json['ayat_mulai'],
      id_surah_akhir: json['id_surah_akhir'],
      ayat_akhir: json['ayat_akhir'],
    );
  }
}
