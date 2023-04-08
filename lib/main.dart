import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:isar/isar.dart';

import 'database/expenses.dart';
import 'database/revenues.dart';
import 'screens/expensesScreen/expense_add_screen.dart';
import 'screens/homeScreen/home_screen.dart';
import 'screens/homeScreen/screen_test_screen.dart';
import 'screens/revenuesScreen/revenue_add_screen.dart';
import 'widgets/custom_transition.dart';

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

final _router = GoRouter(
  initialLocation: '/HomeScreen',
  routes: [
    GoRoute(
      path: '/HomeScreen',
      pageBuilder: (context, state) => const MaterialPage(
        child: HomeScreen(),
      ),
    ),
    GoRoute(
        path: '/expense/add/:editID',
        pageBuilder: (context, state) {
          return customTransition(
            child: ExpenseAddScreen(
              editID: state.params['editID'],
            ),
            start: 1,
            end: 0,
          );
        }),
    GoRoute(
      path: '/revenue/add/:editID',
      pageBuilder: (context, state) {
        return customTransition(
            child: RevenueAddScreen(
              editID: state.params['editID'],
            ),
            start: -1,
            end: 0);
      },
    ),
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(
        child: WidgetTestScreen(),
      ),
    ),
  ],
  errorPageBuilder: (context, state) => const MaterialPage(
    child: Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    ),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Butce Guru',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routerConfig: _router,
    );
  }
}
