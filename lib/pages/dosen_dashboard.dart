import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widget/dashboard_menu.dart';
import '../widget/summary_card.dart';
import 'data_mahasiswa_page.dart';
import 'login.dart';
import 'validasi_krs_page.dart';

class DosenDashboard extends StatefulWidget {
  const DosenDashboard({super.key});

  @override
  State<DosenDashboard> createState() => _DosenDashboardState();
}

class _DosenDashboardState extends State<DosenDashboard> {
  int jumlahMenunggu() {
    return krsMahasiswa.where((item) => item.status == "Menunggu ACC").length;
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
    const red = Color(0xffb71c1c);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Dosen"),
        backgroundColor: red,
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
            "Halo, Dosen 👋",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 6),
          const Text(
            "Validasi pengajuan KRS mahasiswa secara cepat.",
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 18),
          SummaryCard(
            title: "Pengajuan Menunggu",
            value: "${jumlahMenunggu()} Mata Kuliah",
            icon: Icons.verified_user_outlined,
            color: red,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _MiniStat(
                  title: "Total Pengajuan",
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
            icon: Icons.fact_check_outlined,
            title: "Validasi KRS Mahasiswa",
            subtitle: "ACC atau tolak pengajuan KRS",
            color: red,
            onTap: () => bukaHalaman(const ValidasiKrsPage()),
          ),
          DashboardMenu(
            icon: Icons.people_alt_outlined,
            title: "Data Mahasiswa",
            subtitle: "Lihat ringkasan KRS mahasiswa",
            color: Colors.indigo,
            onTap: () => bukaHalaman(const DataMahasiswaPage()),
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