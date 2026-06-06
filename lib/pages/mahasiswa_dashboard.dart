import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widget/dashboard_menu.dart';
import '../widget/summary_card.dart';
import 'ambil_krs_page.dart';
import 'daftar_matkul_page.dart';
import 'login.dart';
import 'riwayat_krs_page.dart';

class MahasiswaDashboard extends StatefulWidget {
  const MahasiswaDashboard({super.key});

  @override
  State<MahasiswaDashboard> createState() => _MahasiswaDashboardState();
}

class _MahasiswaDashboardState extends State<MahasiswaDashboard> {
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

  Future<void> bukaHalaman(Widget page) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xff0d47a1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Mahasiswa"),
        backgroundColor: primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: "Logout",
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            "Halo, Afrizal Noer 👋",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 6),
          const Text(
            "Kelola pengisian KRS semester ini dengan mudah.",
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 18),
          SummaryCard(
            title: "Total SKS Diambil",
            value: "${totalSks()} / 24 SKS",
            icon: Icons.assignment_turned_in_outlined,
            color: primary,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _MiniStat(
                  title: "Mata Kuliah",
                  value: "${krsMahasiswa.length}",
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MiniStat(
                  title: "Disetujui",
                  value: "${jumlahDisetujui()}",
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          DashboardMenu(
            icon: Icons.menu_book_outlined,
            title: "Daftar Mata Kuliah",
            subtitle: "Lihat semua mata kuliah tersedia",
            color: primary,
            onTap: () => bukaHalaman(const DaftarMatkulPage()),
          ),
          DashboardMenu(
            icon: Icons.add_circle_outline,
            title: "Ambil Mata Kuliah",
            subtitle: "Pilih mata kuliah untuk KRS",
            color: Colors.green,
            onTap: () => bukaHalaman(const AmbilKrsPage()),
          ),
          DashboardMenu(
            icon: Icons.history_outlined,
            title: "Riwayat KRS",
            subtitle: "Lihat status pengajuan KRS",
            color: Colors.orange,
            onTap: () => bukaHalaman(const RiwayatKrsPage()),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _MiniStat({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.black.withAlpha(13)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black54, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}