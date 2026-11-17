class Absensi {
  final int? idAbsensi;
  final int idKar;
  final String namaKar;
  final String absen;

  Absensi({
    this.idAbsensi,
    required this.idKar,
    required this.namaKar,
    required this.absen,
  });

  factory Absensi.fromJson(Map<String, dynamic> json) {
    return Absensi(
      idAbsensi: json['id_absensi'] != null
          ? int.tryParse(json['id_absensi'].toString())
          : null,
      idKar: json['id_kar'] != null
          ? (int.tryParse(json['id_kar'].toString()) ?? 0)
          : 0,
      namaKar: json['nama_kar']?.toString() ?? '',
      absen: json['absen']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_kar': idKar,
      'nama_kar': namaKar,
      'absen': absen,
    };
  }
}
