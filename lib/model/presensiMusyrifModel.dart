class PresensiMusyrif {
  final String id_presensi;
  final String id_user;
  final String tanggal;
  final String jam;

  PresensiMusyrif({
    required this.id_presensi,
    required this.id_user,
    required this.tanggal,
    required this.jam,
  });

  factory PresensiMusyrif.fromJson(Map<String, dynamic> json) {
    return PresensiMusyrif(
      id_presensi: json['id_presensi'],
      id_user: json['id_user'],
      tanggal: json['tanggal'],
      jam: json['jam'],
    );
  }
}
