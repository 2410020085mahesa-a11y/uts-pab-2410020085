import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../models/absensi.dart';

class AbsensiController extends GetxController {
  var absensiList = <Absensi>[].obs;
  var isLoading = false.obs;

  String get apiUrl => '$baseUrl/absensi';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  void onInit() {
    super.onInit();
    tangkapDataAbsensi();
  }

  Future<void> tangkapDataAbsensi() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        absensiList.value =
            data.map((item) => Absensi.fromJson(item)).toList();
      } else {
        throw Exception('Gagal ambil data absensi');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addAbsensi(Absensi absensi) async {
    final response = await http.post(Uri.parse(apiUrl),
        headers: headers, body: json.encode(absensi.toJson()));
    if (response.statusCode == 201) {
      absensiList.add(Absensi.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Gagal simpan data absensi');
    }
  }

  Future<void> updateAbsensi(int id, Absensi absensi) async {
    final response = await http.put(Uri.parse('$apiUrl/$id'),
        headers: headers, body: json.encode(absensi.toJson()));
    if (response.statusCode == 200) {
      final index = absensiList.indexWhere((a) => a.idAbsensi == id);
      if (index != -1) {
        absensiList[index] = Absensi.fromJson(json.decode(response.body));
      }
    } else {
      throw Exception('Gagal ubah data absensi');
    }
  }

  Future<void> deleteAbsensi(int id) async {
    final response =
        await http.delete(Uri.parse('$apiUrl/$id'), headers: headers);
    if (response.statusCode == 204) {
      absensiList.removeWhere((a) => a.idAbsensi == id);
    } else {
      throw Exception('Gagal hapus data absensi');
    }
  }
}