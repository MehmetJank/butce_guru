import 'package:butce_guru/database/expenses.dart';
import 'package:butce_guru/database/revenues.dart';
import 'package:butce_guru/screens/expensesScreen/expenses_add_test_screen.dart';
import 'package:butce_guru/screens/expensesScreen/expenses_list_test_screen.dart';
import 'package:butce_guru/screens/expensesScreen/expenses_one_screen.dart';
import 'package:butce_guru/screens/homeScreen/screen_test_screen.dart';
import 'package:butce_guru/screens/revenuesScreen/revenue_add_test2_screen.dart';
import 'package:butce_guru/screens/test/home_scren_birlestirme_test.dart';
import 'package:butce_guru/screens/test/revenue_expense_filter.dart';
import 'package:butce_guru/screens/test/revenue_expense_filter2.dart';
import 'package:butce_guru/screens/test/test_scren.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import 'screens/revenuesScreen/revenue_list_test_screen.dart';

void main() async {
  final isar = await openIsar();
  runApp(
    Provider.value(
      value: isar,
      child: const MyApp(),
    ),
  );
}

Future<Isar> openIsar() async {
  final isar = await Isar.open(
    [RevenuesSchema, ExpensesSchema],
  );
  print('Isar açıldı');
  return isar;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Butce Guru',
        debugShowCheckedModeBanner: false,
        routes: {
          '/expense/add': (context) => const ExpenseAddScreen(),
          '/expenses/list': (context) => const ExpensesListScreen(),
          '/expenses/final': (context) => const ExpensesScreen(),
          '/revenue/add': (context) => const RevenueAddScreen(),
          '/revenue/list': (context) => const RevenueListScreen(),
          '/widgettestscreen': (context) => const WidgetTestScreen(),
          '/testScreen': (context) => const TestScreen(),
          '/filterScreen': (context) => const GetFilter(),
          '/homeScreenTest': (context) => const HomeScreenBirlestirmeTest(),
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const WidgetTestScreen());
  }
}
