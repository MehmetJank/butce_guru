import 'package:isar/isar.dart';

part 'revenues.g.dart';

@collection
class Revenues {
  Id id = Isar.autoIncrement; // auto increment id.
  String? revenueTitle; // gelir ismi ornek: maas
  String? revenueDescription; //aciklama // ornek: maas
  double? revenueAmount; //tutar // ornek: 100.0
  String? revenueSource; // gelir kaynagi // ornek: is
  String? revenueDate; //tarih  // ornek: 2021-09-01
}
