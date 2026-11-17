class Karyawan {
  final int? idKar;
  final String nama;
  final String sex;
  final String jabatan;
  final String norek;
  final String upah;
  final String tglLahir;
  final String kotaLahir;
  final String alamat;
  final String tglMasuk;
  final String? tglKeluar;
  final String status;

  Karyawan({
    this.idKar,
    required this.nama,
    required this.sex,
    required this.jabatan,
    required this.norek,
    required this.upah,
    required this.tglLahir,
    required this.kotaLahir,
    required this.alamat,
    required this.tglMasuk,
    this.tglKeluar,
    required this.status,
  });

  factory Karyawan.fromJson(Map<String, dynamic> json) {
    return Karyawan(
      idKar: json['id_kar'] != null
          ? int.tryParse(json['id_kar'].toString())
          : null,
      nama: json['nama']?.toString() ?? '',
      sex: json['sex']?.toString() ?? '',
      jabatan: json['jabatan']?.toString() ?? '',
      norek: json['norek']?.toString() ?? '',
      upah: json['upah']?.toString() ?? '',
      tglLahir: json['tgl_lahir']?.toString() ?? '',
      kotaLahir: json['kota_lahir']?.toString() ?? '',
      alamat: json['alamat']?.toString() ?? '',
      tglMasuk: json['tgl_masuk']?.toString() ?? '',
      tglKeluar: json['tgl_keluar']?.toString(),
      status: json['status']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'sex': sex,
      'jabatan': jabatan,
      'norek': norek,
      'upah': upah,
      'tgl_lahir': tglLahir,
      'kota_lahir': kotaLahir,
      'alamat': alamat,
      'tgl_masuk': tglMasuk,
      'tgl_keluar': tglKeluar,
      'status': status,
    };
  }
}
