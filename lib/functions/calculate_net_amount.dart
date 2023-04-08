import 'package:isar/isar.dart';

import '../database/expenses.dart';
import '../database/revenues.dart';

Future<double> calculateNetAmount(Isar isar) async {
  double totalRevenueAmount = await getTotalRevenueAmount(isar);
  double totalExpenseAmount = await getTotalExpenseAmount(isar);
  return totalRevenueAmount - totalExpenseAmount;
}

Future<double> getTotalRevenueAmount(Isar isar) async {
  double totalRevenueAmount = 0.0;
  final revenues = isar.revenues;
  final revenueList = await revenues.where().findAll();
  for (var revenue in revenueList) {
    totalRevenueAmount += revenue.revenueAmount!;
  }
  return totalRevenueAmount;
}

Future<double> getTotalExpenseAmount(Isar isar) async {
  double totalExpenseAmount = 0.0;
  final expenses = isar.expenses;
  final expenseList = await expenses.where().findAll();
  for (var expense in expenseList) {
    totalExpenseAmount += expense.expenseAmount!;
  }
  return totalExpenseAmount;
}
