import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/krs_model.dart';
import '../widget/status_badge.dart';

class ValidasiKrsPage extends StatefulWidget {
  const ValidasiKrsPage({super.key});

  @override
  State<ValidasiKrsPage> createState() => _ValidasiKrsPageState();
}

class _ValidasiKrsPageState extends State<ValidasiKrsPage> {
  void ubahStatus(KrsItem item, String status) {
    setState(() {
      item.status = status;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("KRS berhasil $status"),
        backgroundColor: status == "Disetujui" ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const red = Color(0xffb71c1c);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Validasi KRS Mahasiswa"),
        backgroundColor: red,
        foregroundColor: Colors.white,
      ),
      body: krsMahasiswa.isEmpty
          ? const Center(
              child: Text(
                "Belum ada pengajuan KRS",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: krsMahasiswa.length,
              itemBuilder: (context, index) {
                final item = krsMahasiswa[index];

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xffffebee),
                              child: Icon(
                                Icons.person,
                                color: Color(0xffb71c1c),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Afrizal Noer",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "NIM: 23122013 • Teknik Informatika",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          item.matkul.nama,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text("${item.matkul.kode} • ${item.matkul.sks} SKS"),
                        Text("Dosen: ${item.matkul.dosen}"),
                        const SizedBox(height: 12),
                        StatusBadge(status: item.status),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: () => ubahStatus(item, "Disetujui"),
                                icon: const Icon(Icons.check),
                                label: const Text("ACC"),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: () => ubahStatus(item, "Ditolak"),
                                icon: const Icon(Icons.close),
                                label: const Text("Tolak"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}