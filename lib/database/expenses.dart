import 'package:isar/isar.dart';

part 'expenses.g.dart';

@collection
class Expenses {
  Id id = Isar.autoIncrement; // auto increment id.
  String name; // harcanan isim ornek: migros
  String description; //aciklama // ornek: yemek alisverisi
  double amount; //tutar // ornek: 100.0
  String date; //tarih  // ornek: 2021-09-01
  String category; //harcanan kategori // ornek: yemek
  String paymentMethod; //odeme sekli // ornek: nakit
  String bankName; // ornek: is bankasi

  Expenses({
    required this.name,
    required this.description,
    required this.amount,
    required this.date,
    required this.category,
    required this.paymentMethod,
    required this.bankName,
  });
}
