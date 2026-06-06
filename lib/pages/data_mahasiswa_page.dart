import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widget/status_badge.dart';

class DataMahasiswaPage extends StatelessWidget {
  const DataMahasiswaPage({super.key});

  int totalSks() {
    int total = 0;
    for (var item in krsMahasiswa) {
      total += item.matkul.sks;
    }
    return total;
  }

  int jumlahDisetujui() {
    return krsMahasiswa.where((item) => item.status == "Disetujui").length;
  }

  int jumlahDitolak() {
    return krsMahasiswa.where((item) => item.status == "Ditolak").length;
  }

  int jumlahMenunggu() {
    return krsMahasiswa.where((item) => item.status == "Menunggu ACC").length;
  }

  @override
  Widget build(BuildContext context) {
    const red = Color(0xffb71c1c);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Mahasiswa"),
        backgroundColor: red,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: Colors.black.withAlpha(13)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 34,
                    backgroundColor: Color(0xffe3f2fd),
                    child: Icon(
                      Icons.person,
                      size: 38,
                      color: Color(0xff0d47a1),
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Afrizal Noer",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text("NIM: 23122013"),
                        Text("Prodi: Teknik Informatika"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: Colors.black.withAlpha(13)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ringkasan KRS",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _InfoRow(
                    title: "Total Mata Kuliah",
                    value: "${krsMahasiswa.length}",
                  ),
                  _InfoRow(title: "Total SKS", value: "${totalSks()}"),
                  _InfoRow(title: "Menunggu ACC", value: "${jumlahMenunggu()}"),
                  _InfoRow(title: "Disetujui", value: "${jumlahDisetujui()}"),
                  _InfoRow(title: "Ditolak", value: "${jumlahDitolak()}"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "Daftar KRS Mahasiswa",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          if (krsMahasiswa.isEmpty)
            const Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Text("Mahasiswa belum mengambil mata kuliah."),
              ),
            )
          else
            ...krsMahasiswa.map((item) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                  side: BorderSide(color: Colors.black.withAlpha(13)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.matkul.nama,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text("${item.matkul.kode} • ${item.matkul.sks} SKS"),
                          ],
                        ),
                      ),
                      StatusBadge(status: item.status),
                    ],
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const _InfoRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}