import 'package:butce_guru/screens/expensesScreen/expenses_add_test_screen.dart';
import 'package:butce_guru/screens/expensesScreen/expenses_list_test_screen.dart';
import 'package:butce_guru/screens/homeScreen/home_screen.dart';
import 'package:butce_guru/screens/revenuesScreen/revenue_add_test_screen.dart';
import 'package:butce_guru/screens/homeScreen/test_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Butce Guru',
        debugShowCheckedModeBanner: false,
        routes: {
          '/expenses': (context) => const ExpensesAddScreen(),
          '/expenses/list': (context) => const ExpensesListScreen(),
          '/revenues': (context) => const RevenueAddScreen(),
          '/test': (context) => const TestScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const WidgetTestScreen());
  }
}
