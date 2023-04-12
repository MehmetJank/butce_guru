import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '/database/expenses.dart';

class CategoryChart extends StatefulWidget {
  const CategoryChart({super.key});

  @override
  State<CategoryChart> createState() => _CategoryChartState();
}

class _CategoryChartState extends State<CategoryChart> {
  late final Isar isar;
  List<_DoughtData> data = [];

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
    calculatePaymentsByCategory(isar).then((paymentMap) {
      final List<_DoughtData> chartData = [];
      paymentMap.forEach((key, value) {
        chartData.add(_DoughtData(key, value));
        if (key == '') {
          chartData.removeLast();
          chartData.add(_DoughtData('Girilmemiş', value));
        }
      });
      setState(() {
        data = chartData;
      });
    });
  }

  Future<Map<String, double>> calculatePaymentsByCategory(Isar isar) async {
    final payments = await isar.expenses.where().findAll();
    final paymentMap = <String, double>{};
    for (final payment in payments) {
      final paymentCategory = payment.expenseCategory ?? '';
      paymentMap[paymentCategory] =
          (paymentMap[paymentCategory] ?? 0) + (payment.expenseAmount ?? 0);
    }
    return paymentMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: FutureBuilder<Map<String, double>>(
          future: calculatePaymentsByCategory(isar),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Hata: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return SfCircularChart(
              title: ChartTitle(
                text: 'Kategoriye Göre Harcamalar',
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              legend: Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
                position: LegendPosition.bottom,
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              series: <CircularSeries>[
                DoughnutSeries<_DoughtData, String>(
                  dataSource: data,
                  xValueMapper: (_DoughtData data, _) => data.x,
                  yValueMapper: (_DoughtData data, _) => data.y,
                  animationDelay: 10,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.inside,
                    overflowMode: OverflowMode.shift,
                    textStyle: TextStyle(
                      fontSize: 12,
                    ),
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

class _DoughtData {
  _DoughtData(this.x, this.y);
  final String x;
  final double y;
}
