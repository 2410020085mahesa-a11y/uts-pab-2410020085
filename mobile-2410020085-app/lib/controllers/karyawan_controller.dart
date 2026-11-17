import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../models/karyawan.dart';

class KaryawanController extends GetxController {
  var karyawanList = <Karyawan>[].obs;
  var isLoading = false.obs;

  String get apiUrl => '$baseUrl/karyawan';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  void onInit() {
    super.onInit();
    tangkapDataKaryawan();
  }

  Future<void> tangkapDataKaryawan() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        karyawanList.value =
            data.map((item) => Karyawan.fromJson(item)).toList();
      } else {
        throw Exception('Gagal ambil data karyawan');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addKaryawan(Karyawan karyawan) async {
    final response = await http.post(Uri.parse(apiUrl),
        headers: headers, body: json.encode(karyawan.toJson()));
    if (response.statusCode == 201) {
      karyawanList.add(Karyawan.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Gagal simpan data karyawan');
    }
  }

  Future<void> updateKaryawan(int id, Karyawan karyawan) async {
    final response = await http.put(Uri.parse('$apiUrl/$id'),
        headers: headers, body: json.encode(karyawan.toJson()));
    if (response.statusCode == 200) {
      final index = karyawanList.indexWhere((k) => k.idKar == id);
      if (index != -1) {
        karyawanList[index] = Karyawan.fromJson(json.decode(response.body));
      }
    } else {
      throw Exception('Gagal ubah data karyawan');
    }
  }

  Future<void> deleteKaryawan(int id) async {
    final response =
        await http.delete(Uri.parse('$apiUrl/$id'), headers: headers);
    if (response.statusCode == 204) {
      karyawanList.removeWhere((k) => k.idKar == id);
    } else {
      throw Exception('Gagal hapus data karyawan');
    }
  }
}