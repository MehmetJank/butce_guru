import 'package:isar/isar.dart';

part 'expenses.g.dart';

@collection
class Expenses {
  Id id = Isar.autoIncrement; // auto increment id.
  String expenseTitle; // harcanan isim ornek: migros
  String expenseDescription; //aciklama // ornek: yemek
  double expenseAmount; //tutar // ornek: 100.0
  String expenseDate; //tarih  // ornek: 2021-09-01
  String expenseUpdateDate; //eklenme veya guncellenme tarihi
  String expenseCategory; //kategori // ornek: yemek
  String paymentMethod; // ornek: nakit
  String bankName; // ornek: is bankasi

  Expenses({
    required this.expenseTitle,
    required this.expenseDescription,
    required this.expenseAmount,
    required this.expenseDate,
    required this.expenseUpdateDate,
    required this.expenseCategory,
    required this.paymentMethod,
    required this.bankName,
  });
}
