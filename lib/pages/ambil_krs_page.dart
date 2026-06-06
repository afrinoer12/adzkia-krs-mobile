import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/krs_model.dart';
import '../models/matkul_model.dart';
import '../widget/matkul_card.dart';

class AmbilKrsPage extends StatefulWidget {
  const AmbilKrsPage({super.key});

  @override
  State<AmbilKrsPage> createState() => _AmbilKrsPageState();
}

class _AmbilKrsPageState extends State<AmbilKrsPage> {
  final TextEditingController searchController = TextEditingController();
  int selectedSemester = 0;

  int totalSks() {
    int total = 0;
    for (var item in krsMahasiswa) {
      total += item.matkul.sks;
    }
    return total;
  }

  bool sudahDiambil(Matkul matkul) {
    return krsMahasiswa.any((item) => item.matkul.id == matkul.id);
  }

  List<Matkul> get filteredMatkul {
    return daftarMatkul.where((matkul) {
      final keyword = searchController.text.toLowerCase();

      final cocokKeyword =
          matkul.nama.toLowerCase().contains(keyword) ||
          matkul.kode.toLowerCase().contains(keyword) ||
          matkul.dosen.toLowerCase().contains(keyword);

      final cocokSemester =
          selectedSemester == 0 || matkul.semester == selectedSemester;

      return cocokKeyword && cocokSemester;
    }).toList();
  }

  Widget semesterButton(int semester) {
    final aktif = selectedSemester == semester;

    return ChoiceChip(
      label: Text(semester == 0 ? "Semua" : "Semester $semester"),
      selected: aktif,
      selectedColor: const Color(0xff0d47a1),
      backgroundColor: Colors.white,
      side: BorderSide(
        color: aktif ? const Color(0xff0d47a1) : Colors.black12,
      ),
      labelStyle: TextStyle(
        color: aktif ? Colors.white : Colors.black87,
        fontWeight: aktif ? FontWeight.w800 : FontWeight.w500,
      ),
      onSelected: (_) {
        setState(() {
          selectedSemester = semester;
        });
      },
    );
  }

  void ambilMatkul(Matkul matkul) {
    if (sudahDiambil(matkul)) {
      hapusMatkul(matkul);
      return;
    }

    if (totalSks() + matkul.sks > 24) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Total SKS tidak boleh lebih dari 24"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      krsMahasiswa.add(KrsItem(matkul: matkul));
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${matkul.nama} berhasil diambil"),
        backgroundColor: Colors.green,
      ),
    );
  }

  void hapusMatkul(Matkul matkul) {
    setState(() {
      krsMahasiswa.removeWhere((item) => item.matkul.id == matkul.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${matkul.nama} dihapus dari KRS"),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = filteredMatkul;

    return Scaffold(
      appBar: AppBar(title: const Text("Ambil Mata Kuliah")),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xff0d47a1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.assignment_add,
                  color: Colors.white,
                  size: 36,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total SKS Diambil",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "${totalSks()} / 24 SKS",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: "Cari mata kuliah, kode, atau dosen...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  semesterButton(0),
                  const SizedBox(width: 8),
                  semesterButton(1),
                  const SizedBox(width: 8),
                  semesterButton(3),
                  const SizedBox(width: 8),
                  semesterButton(5),
                  const SizedBox(width: 8),
                  semesterButton(7),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: data.isEmpty
                ? const Center(
                    child: Text(
                      "Mata kuliah tidak ditemukan",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final matkul = data[index];
                      final diambil = sudahDiambil(matkul);

                      return MatkulCard(
                        matkul: matkul,
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                diambil ? Colors.red : const Color(0xff0d47a1),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          onPressed: () => ambilMatkul(matkul),
                          child: Text(diambil ? "Hapus" : "Ambil"),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}