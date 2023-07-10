import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'database/expenses.dart';
import 'database/revenues.dart';
import 'screens/chart_slider_screen.dart';
import 'screens/date_picker_screen.dart';
import 'screens/expense_screen.dart';
import 'screens/home_screen.dart';
import 'screens/revenue_screen.dart';
import 'widgets/custom_transition.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter binding is initialized
  final isar = await openIsar();
  runApp(
    Provider.value(
      value: isar,
      child: const MyApp(),
    ),
  );
}

// Future<Isar> openIsar() async {
//   final isar = await Isar.open(
//     relaxedDurability: true,
//     [RevenuesSchema, ExpensesSchema],
//     directory: '',
//   );
//   return isar;
// }

Future<Isar> openIsar() async {
  final directory = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [RevenuesSchema, ExpensesSchema],
    directory: directory.path,
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
        path: '/expense/:editID',
        pageBuilder: (context, state) {
          return customTransition(
            child: ExpenseScreen(
              editID: state.params['editID'],
            ),
            start: 1,
            end: 0,
          );
        }),
    GoRoute(
      path: '/revenue/:editID',
      pageBuilder: (context, state) {
        return customTransition(
          child: RevenueScreen(
            editID: state.params['editID'],
          ),
          start: -1,
          end: 0,
        );
      },
    ),
    GoRoute(
      path: '/datePicker',
      pageBuilder: (context, state) {
        return customTransition(
          child: DatePicker(),
          start: 1,
          end: 0,
        );
      },
    ),
    GoRoute(
      path: '/charts/:startDate/:endDate',
      pageBuilder: (context, state) {
        final startDate = DateTime.parse(state.params['startDate']!);
        final endDate = DateTime.parse(state.params['endDate']!);
        return customTransition(
          child: ChartSlider(
            startDate: startDate,
            endDate: endDate,
          ),
          start: 1,
          end: 0,
        );
      },
    ),
  ],
  errorPageBuilder: (context, state) => const MaterialPage(
    child: Scaffold(
      body: Center(
        child: Text('Error!'),
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
