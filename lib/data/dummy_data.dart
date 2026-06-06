import '../models/krs_model.dart';
import '../models/matkul_model.dart';

final List<Matkul> daftarMatkul = [
  // =======================
  // SEMESTER 1 GANJIL
  // =======================
  const Matkul(
    id: 1,
    kode: "IF101",
    nama: "Algoritma dan Pemrograman",
    sks: 3,
    semester: 1,
    dosen: "Bapak Andi, M.Kom",
  ),
  const Matkul(
    id: 2,
    kode: "IF102",
    nama: "Pengantar Teknologi Informasi",
    sks: 2,
    semester: 1,
    dosen: "Ibu Rina, M.Kom",
  ),

  // =======================
  // SEMESTER 2 GENAP
  // =======================
  const Matkul(
    id: 3,
    kode: "IF151",
    nama: "Matematika Diskrit",
    sks: 3,
    semester: 2,
    dosen: "Bapak Rahman, M.Kom",
  ),
  const Matkul(
    id: 4,
    kode: "IF152",
    nama: "Pemrograman Dasar",
    sks: 3,
    semester: 2,
    dosen: "Ibu Lestari, M.Kom",
  ),

  // =======================
  // SEMESTER 3 GANJIL
  // =======================
  const Matkul(
    id: 5,
    kode: "IF201",
    nama: "Struktur Data",
    sks: 3,
    semester: 3,
    dosen: "Bapak Dedi, M.Kom",
  ),
  const Matkul(
    id: 6,
    kode: "IF202",
    nama: "Basis Data",
    sks: 3,
    semester: 3,
    dosen: "Ibu Sari, M.Kom",
  ),

  // =======================
  // SEMESTER 4 GENAP
  // =======================
  const Matkul(
    id: 7,
    kode: "IF251",
    nama: "Pemrograman Web",
    sks: 3,
    semester: 4,
    dosen: "Bapak Fikri, M.Kom",
  ),
  const Matkul(
    id: 8,
    kode: "IF252",
    nama: "Sistem Operasi",
    sks: 3,
    semester: 4,
    dosen: "Ibu Melati, M.Kom",
  ),

  // =======================
  // SEMESTER 5 GANJIL
  // =======================
  const Matkul(
    id: 9,
    kode: "IF301",
    nama: "Pemrograman Mobile",
    sks: 3,
    semester: 5,
    dosen: "Bapak Fajar, M.Kom",
  ),
  const Matkul(
    id: 10,
    kode: "IF302",
    nama: "Kecerdasan Buatan",
    sks: 3,
    semester: 5,
    dosen: "Ibu Putri, M.T.I",
  ),
  const Matkul(
    id: 11,
    kode: "IF303",
    nama: "Rekayasa Perangkat Lunak",
    sks: 3,
    semester: 5,
    dosen: "Bapak Rudi, M.Kom",
  ),
  const Matkul(
    id: 12,
    kode: "IF304",
    nama: "Interaksi Manusia dan Komputer",
    sks: 2,
    semester: 5,
    dosen: "Ibu Maya, M.Kom",
  ),

  // =======================
  // SEMESTER 6 GENAP
  // =======================
  const Matkul(
    id: 13,
    kode: "IF351",
    nama: "Machine Learning",
    sks: 3,
    semester: 6,
    dosen: "Bapak Doni, M.Kom",
  ),
  const Matkul(
    id: 14,
    kode: "IF352",
    nama: "Cloud Computing",
    sks: 3,
    semester: 6,
    dosen: "Ibu Nabila, M.Kom",
  ),
  const Matkul(
    id: 15,
    kode: "IF353",
    nama: "Manajemen Proyek TI",
    sks: 2,
    semester: 6,
    dosen: "Bapak Rizal, M.Kom",
  ),

  // =======================
  // SEMESTER 7 GANJIL
  // =======================
  const Matkul(
    id: 16,
    kode: "IF401",
    nama: "Data Mining",
    sks: 3,
    semester: 7,
    dosen: "Bapak Rahmat, M.Kom",
  ),
  const Matkul(
    id: 17,
    kode: "IF402",
    nama: "Keamanan Sistem Informasi",
    sks: 3,
    semester: 7,
    dosen: "Ibu Nanda, M.Kom",
  ),

  // =======================
  // SEMESTER 8 GENAP
  // =======================
  const Matkul(
    id: 18,
    kode: "IF451",
    nama: "Kerja Praktek",
    sks: 3,
    semester: 8,
    dosen: "Bapak Aditya, M.Kom",
  ),
  const Matkul(
    id: 19,
    kode: "IF452",
    nama: "Skripsi",
    sks: 6,
    semester: 8,
    dosen: "Ibu Putri, M.T.I",
  ),
];

final List<KrsItem> krsMahasiswa = [];