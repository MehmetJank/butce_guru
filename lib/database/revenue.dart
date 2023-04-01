import 'package:isar/isar.dart';

part 'revenue.g.dart';

@collection
class Revenue {
  Id id = Isar.autoIncrement; // auto increment id.
  String revenueName; // gelir ismi ornek: maas
  String revenueDescription; //aciklama // ornek: maas
  double revenueAmount; //tutar // ornek: 100.0
  String revenueDate; //tarih  // ornek: 2021-09-01
  String revenueCategory; //gelir kategori // ornek: maas

  Revenue({
    required this.revenueName,
    required this.revenueDescription,
    required this.revenueAmount,
    required this.revenueDate,
    required this.revenueCategory,
  });
}
