import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widget/status_badge.dart';

class RiwayatKrsPage extends StatelessWidget {
  const RiwayatKrsPage({super.key});

  int totalSks() {
    int total = 0;
    for (var item in krsMahasiswa) {
      total += item.matkul.sks;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat KRS"),
      ),
      body: krsMahasiswa.isEmpty
          ? const Center(
              child: Text(
                "Belum ada mata kuliah yang diambil",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xff0d47a1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.history, color: Colors.white, size: 34),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          "Total SKS: ${totalSks()} / 24",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ...krsMahasiswa.map((item) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
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
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              color: const Color(0xffe3f2fd),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text(
                                "${item.matkul.sks}",
                                style: const TextStyle(
                                  color: Color(0xff0d47a1),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.matkul.nama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "${item.matkul.kode} • ${item.matkul.sks} SKS",
                                  style: const TextStyle(color: Colors.black54),
                                ),
                                Text(
                                  item.matkul.dosen,
                                  style: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                StatusBadge(status: item.status),
                              ],
                            ),
                          ),
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