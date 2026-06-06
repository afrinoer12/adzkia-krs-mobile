import 'matkul_model.dart';

class KrsItem {
  final Matkul matkul;
  String status;

  KrsItem({
    required this.matkul,
    this.status = "Menunggu ACC",
  });
}