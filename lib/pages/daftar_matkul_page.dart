import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/matkul_model.dart';
import '../widget/matkul_card.dart';

class DaftarMatkulPage extends StatefulWidget {
  const DaftarMatkulPage({super.key});

  @override
  State<DaftarMatkulPage> createState() => _DaftarMatkulPageState();
}

class _DaftarMatkulPageState extends State<DaftarMatkulPage> {
  final TextEditingController searchController = TextEditingController();

  int selectedSemester = 0;

  final List<int> daftarSemester = [0, 1, 2, 3, 4, 5, 6, 7, 8];

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

  String labelSemester(int semester) {
    if (semester == 0) {
      return "Semua";
    }

    if (semester % 2 == 0) {
      return "Semester $semester Genap";
    }

    return "Semester $semester Ganjil";
  }

  Widget semesterButton(int semester) {
    final aktif = selectedSemester == semester;

    return ChoiceChip(
      label: Text(labelSemester(semester)),
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

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = filteredMatkul;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Mata Kuliah"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  onChanged: (_) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: "Cari mata kuliah, kode, atau dosen...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color(0xfff4f7fb),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: daftarSemester.map((semester) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: semesterButton(semester),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: data.isEmpty
                ? const Center(
                    child: Text(
                      "Mata kuliah tidak ditemukan",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return MatkulCard(matkul: data[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}