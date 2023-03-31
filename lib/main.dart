import 'package:butce_guru/screens/expensesScreen/expenses_add_test_screen.dart';
import 'package:butce_guru/screens/expensesScreen/expenses_list_test_screen.dart';
import 'package:butce_guru/screens/expensesScreen/expenses_one_screen.dart';
import 'package:butce_guru/screens/homeScreen/screen_test_screen.dart';
import 'package:butce_guru/screens/revenuesScreen/revenue_add_test_screen.dart';
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
          '/expense/add': (context) => const ExpenseAddScreen(),
          '/expenses/list': (context) => const ExpensesListScreen(),
          '/expenses/final': (context) => const ExpensesScreen(),
          '/revenue/add': (context) => const RevenueAddScreen(),
          // '/revenue/list': (context) => const RevenueListScreen(),
          '/widgettestscreen': (context) => const WidgetTestScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const WidgetTestScreen());
  }
}
