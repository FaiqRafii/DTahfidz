class PresensiSantri {
  final String id_presensi;
  final String id_santri;
  final String tanggal;
  final String jam;
  final String status;
  final String nama;

  PresensiSantri({
    required this.id_presensi,
    required this.id_santri,
    required this.tanggal,
    required this.jam,
    required this.status,
    required this.nama,
  });

  factory PresensiSantri.fromJson(Map<String, dynamic> json) {
    return PresensiSantri(
      id_presensi: json['id_presensi'],
      id_santri: json['id_santri'],
      tanggal: json['tanggal'],
      jam: json['jam'],
      status: json['status'],
      nama: '',
    );
  }
}
