import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/color.dart';
import '/database/expenses.dart';
import '/database/revenues.dart';

class AmountChart extends StatefulWidget {
  const AmountChart({super.key});

  @override
  State<AmountChart> createState() => _AmountChartState();
}

class _AmountChartState extends State<AmountChart> {
  late final Isar isar;

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
    calculateAmount();
  }

  Future<Map<String, double>> calculateAmount() async {
    final expenses = await isar.expenses.where().findAll();
    final revenues = await isar.revenues.where().findAll();
    final amountMap = <String, double>{};
    for (final expense in expenses) {
      final date = expense.expenseDate ?? '';
      amountMap[date] = (amountMap[date] ?? 0) - (expense.expenseAmount ?? 0);
    }
    for (final revenue in revenues) {
      final date = revenue.revenueDate ?? '';
      amountMap[date] = (amountMap[date] ?? 0) + (revenue.revenueAmount ?? 0);
    }
    return amountMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: FutureBuilder<Map<String, double>>(
          future: calculateAmount(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final amountMap = snapshot.data!;
            return SfCartesianChart(
              title: ChartTitle(
                text: 'Gelir-Gider Grafiği',
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              primaryXAxis: CategoryAxis(
                labelRotation: 90,
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              primaryYAxis: NumericAxis(
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              series: <ChartSeries>[
                StackedAreaSeries<MapEntry<String, double>, String>(
                  dataSource: amountMap.entries.toList(),
                  xValueMapper: (entry, _) => entry.key,
                  yValueMapper: (entry, _) => entry.value,
                  borderDrawMode: BorderDrawMode.excludeBottom,
                  color: AppColors.primaryColor,
                  borderWidth: 2,
                  borderColor: Colors.white,
                  gradient: LinearGradient(
                    colors: <Color>[
                      AppColors.secondaryColor,
                      AppColors.primaryColor,
                    ],
                    stops: const <double>[0.2, 0.8],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
