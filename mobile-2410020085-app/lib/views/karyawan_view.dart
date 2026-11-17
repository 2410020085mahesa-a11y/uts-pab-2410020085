import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/karyawan_controller.dart';

class KaryawanView extends StatelessWidget {
  KaryawanView({super.key});

  final KaryawanController controller = Get.put(KaryawanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Karyawan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.tangkapDataKaryawan,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.karyawanList.isEmpty) {
          return const Center(child: Text('Tidak ada data karyawan'));
        }
        return ListView.builder(
          itemCount: controller.karyawanList.length,
          itemBuilder: (context, index) {
            final k = controller.karyawanList[index];
            return Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(k.nama,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 5),
                    Text('ID: ${k.idKar}'),
                    Text('Jabatan: ${k.jabatan}'),
                    Text('Jenis Kelamin: ${k.sex}'),
                    Text('No. Rekening: ${k.norek}'),
                    Text('Upah: ${k.upah}'),
                    Text('Tempat, Tgl Lahir: ${k.kotaLahir}, ${k.tglLahir}'),
                    Text('Alamat: ${k.alamat}'),
                    Text('Tgl Masuk: ${k.tglMasuk}'),
                    Text('Tgl Keluar: ${k.tglKeluar ?? '-'}'),
                    Text('Status: ${k.status}'),
                    const SizedBox(height: 10),
                    OverflowBar(
                      alignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: const Text('Hapus'),
                          onPressed: () {
                            controller.deleteKaryawan(k.idKar!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}