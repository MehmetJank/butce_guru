import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/color.dart';
import '/database/expenses.dart';

class BankNameMethodChart extends StatefulWidget {
  const BankNameMethodChart({super.key, this.startDate, this.endDate});
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<BankNameMethodChart> createState() => _BankNameMethodChartState();
}

class _BankNameMethodChartState extends State<BankNameMethodChart> {
  late final Isar isar;
  List<_ChartData> data = [];

  String formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
  }

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
    bankName(
      formatDateTime(widget.startDate!),
      formatDateTime(widget.endDate!),
    ).then((bankMap) {
      final List<_ChartData> chartData = [];
      bankMap.forEach((key, value) {
        chartData.add(_ChartData(key, value));
      });
      setState(() {
        data = chartData;
      });
    });
  }

  Future<Map<String, double>> bankName(String startDate, String endDate) async {
    final bank = await isar.expenses
        .where()
        .filter()
        .expenseDateBetween(
          startDate.toString(),
          endDate.toString(),
          includeLower: true,
          includeUpper: true,
        )
        .findAll();
    final bankMap = <String, double>{};
    for (final bank in bank) {
      final bankName = bank.bankName ?? 'Girilmemiş';
      final amount = bank.expenseAmount ?? 0;
      bankMap[bankName] = (bankMap[bankName] ?? 0) + amount;
    }
    return bankMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: FutureBuilder<Map<String, double>>(
          future: bankName(
            formatDateTime(widget.startDate!),
            formatDateTime(widget.endDate!),
          ),
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
            final bankMap = snapshot.data!;
            final List<_ChartData> chartData = [];
            bankMap.forEach((key, value) {
              chartData.add(_ChartData(key, value));
              if (key == '') {
                chartData.removeLast();
                chartData.add(_ChartData('Girilmemiş', value));
              }
            });
            return SfCartesianChart(
              primaryYAxis: NumericAxis(
                labelFormat: '{value}₺',
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              primaryXAxis: CategoryAxis(
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              title: ChartTitle(
                text: 'Banka Adına Göre Harcama Grafiği',
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              series: <ChartSeries>[
                StackedBarSeries<_ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  color: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                  borderGradient: LinearGradient(
                    colors: <Color>[
                      AppColors.primaryColor,
                      AppColors.primaryColor,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  borderWidth: 15,
                  dataLabelMapper: (_ChartData data, _) =>
                      '${data.y.toStringAsFixed(2)} TL',
                  legendItemText: 'Banka Adına Göre Harcama Grafiği',
                  animationDelay: 0,
                  animationDuration: 1500,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
