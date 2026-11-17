import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/absensi_controller.dart';

class AbsensiView extends StatelessWidget {
  AbsensiView({super.key});

  final AbsensiController controller = Get.put(AbsensiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Absensi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.tangkapDataAbsensi,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.absensiList.isEmpty) {
          return const Center(child: Text('Tidak ada data absensi'));
        }
        return ListView.builder(
          itemCount: controller.absensiList.length,
          itemBuilder: (context, index) {
            final a = controller.absensiList[index];
            return Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(a.namaKar,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 5),
                    Text('ID Absensi: ${a.idAbsensi}'),
                    Text('ID Karyawan: ${a.idKar}'),
                    Text('Tanggal Absen: ${a.absen}'),
                    const SizedBox(height: 10),
                    OverflowBar(
                      alignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: const Text('Hapus'),
                          onPressed: () {
                            controller.deleteAbsensi(a.idAbsensi!);
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