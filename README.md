# 🎓 Adzkia KRS Mobile

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Status](https://img.shields.io/badge/Status-Ready-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/License-Educational-blue?style=for-the-badge)

</div>

---

## 📌 Tentang Project

**Adzkia KRS Mobile** adalah aplikasi mobile berbasis **Flutter** untuk membantu proses pengisian **Kartu Rencana Studi (KRS)** mahasiswa.

Aplikasi ini dibuat sebagai project pembelajaran Flutter dengan fitur utama seperti login mahasiswa dan dosen, daftar mata kuliah, pengambilan KRS, riwayat KRS, serta validasi KRS oleh dosen.

---

## ✨ Fitur Aplikasi

### 👨‍🎓 Mahasiswa

- Login sebagai mahasiswa
- Melihat dashboard mahasiswa
- Melihat daftar mata kuliah
- Mencari mata kuliah berdasarkan nama, kode, atau dosen
- Filter mata kuliah berdasarkan semester
- Mengambil mata kuliah
- Menghapus mata kuliah dari KRS
- Melihat total SKS
- Melihat riwayat KRS
- Melihat status KRS:
  - Menunggu ACC
  - Disetujui
  - Ditolak

### 👨‍🏫 Dosen

- Login sebagai dosen
- Melihat dashboard dosen
- Melihat pengajuan KRS mahasiswa
- Validasi KRS mahasiswa
- ACC atau tolak mata kuliah
- Melihat data mahasiswa
- Melihat ringkasan KRS mahasiswa

---

## 🖼️ Tampilan Aplikasi

Aplikasi menggunakan desain modern dengan:

- UI clean dan rapi
- Warna utama biru dan merah
- Card layout modern
- Search bar
- Filter semester
- Badge status KRS
- Dashboard statistik
- Tampilan mobile friendly

---

## 🛠️ Teknologi yang Digunakan

- **Flutter**
- **Dart**
- **Material Design 3**
- **Data Dummy / Local Data**

---

## 📂 Struktur Folder

```bash
lib/
│
├── main.dart
│
├── models/
│   ├── matkul_model.dart
│   └── krs_model.dart
│
├── data/
│   └── dummy_data.dart
│
├── widgets/
│   ├── dashboard_menu.dart
│   ├── matkul_card.dart
│   ├── status_badge.dart
│   └── summary_card.dart
│
└── pages/
    ├── login_page.dart
    ├── mahasiswa_dashboard.dart
    ├── dosen_dashboard.dart
    ├── daftar_matkul_page.dart
    ├── ambil_krs_page.dart
    ├── riwayat_krs_page.dart
    ├── validasi_krs_page.dart
    └── data_mahasiswa_page.dart
