import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '/database/expenses.dart';

class PaymentMethodChart extends StatefulWidget {
  const PaymentMethodChart({Key? key}) : super(key: key);

  @override
  State<PaymentMethodChart> createState() => _PaymentMethodChartState();
}

class _PaymentMethodChartState extends State<PaymentMethodChart> {
  late final Isar isar;
  List<PieData> data = [];

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
    calculatePaymentsByMethod(isar).then((paymentMap) {
      final List<PieData> chartData = [];
      paymentMap.forEach((key, value) {
        chartData.add(PieData(key, value));
        if (key == '') {
          chartData.removeLast();
          chartData.add(PieData('Girilmemiş', value));
        }
      });
      setState(() {
        data = chartData;
      });
    });
  }

  Future<Map<String, double>> calculatePaymentsByMethod(Isar isar) async {
    final payments = await isar.expenses.where().findAll();
    final paymentMap = <String, double>{};
    for (final payment in payments) {
      final paymentMethod = payment.paymentMethod ?? '';
      paymentMap[paymentMethod] =
          (paymentMap[paymentMethod] ?? 0) + (payment.expenseAmount ?? 0);
    }
    return paymentMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: SfCircularChart(
          title: ChartTitle(
            text: 'Ödeme Yöntemleri',
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            position: LegendPosition.bottom,
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          series: <PieSeries>[
            PieSeries<PieData, String>(
              animationDelay: 10,
              name: 'Ödeme Yöntemleri',
              legendIconType: LegendIconType.circle,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.inside,
                overflowMode: OverflowMode.shift,
                textStyle: TextStyle(
                  fontSize: 12,
                ),
              ),
              emptyPointSettings: EmptyPointSettings(
                color: Colors.red,
                mode: EmptyPointMode.zero,
              ),
              dataSource: data,
              xValueMapper: (PieData data, _) => data.category,
              yValueMapper: (PieData data, _) => data.amount,
              dataLabelMapper: (PieData data, _) =>
                  '${data.category}: ${data.amount} TL',
            ),
          ],
        ),
      ),
    );
  }
}

class PieData {
  PieData(this.category, this.amount);

  final String category;
  final double amount;
}
