import 'package:isar/isar.dart';

part 'expenses.g.dart';

@collection
class Expenses {
  Id id = Isar.autoIncrement; // auto increment id.
  String? expenseTitle; // harcanan isim ornek: migros
  String? expenseDescription; //aciklama // ornek: yemek
  double? expenseAmount; //tutar // ornek: 100.0
  String? expenseDate; //tarih  // ornek: 2021-09-01
  String? expenseCategory; //kategori // ornek: yemek
  String? paymentMethod; // ornek: nakit
  String? bankName; // ornek: is bankasi
}
