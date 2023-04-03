import 'package:butce_guru/database/expenses.dart';
import 'package:butce_guru/database/revenues.dart';
import 'package:butce_guru/screens/expensesScreen/expense_add_screen.dart';
import 'package:butce_guru/screens/homeScreen/home_screen.dart';
import 'package:butce_guru/screens/homeScreen/screen_test_screen.dart';
import 'package:butce_guru/screens/revenuesScreen/revenue_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

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
          '/homeScreen': (context) => const HomeScreen(),
          '/expense/add': (context) => const ExpenseAddScreen(),
          '/revenue/add': (context) => const RevenueAddScreen(),
          '/widgettestscreen': (context) => const WidgetTestScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const WidgetTestScreen());
  }
}
