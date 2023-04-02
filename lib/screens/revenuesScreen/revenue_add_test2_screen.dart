import 'package:butce_guru/database/revenues.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class RevenueAddScreen extends StatefulWidget {
  const RevenueAddScreen({super.key});

  @override
  State<RevenueAddScreen> createState() => _RevenueAddScreenState();
}

class _RevenueAddScreenState extends State<RevenueAddScreen> {
  late final Isar isar;
  final _textEditingController = TextEditingController();

  final _formValues = <String, String>{};

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
  }

  addRevenue(
    String revenueTitle,
    String revenueDescription,
    double revenueAmount,
    String revenueSource,
    String revenueDate,
  ) async {
    final newRevenue = Revenues(
      revenueTitle: revenueTitle,
      revenueDescription: revenueDescription,
      revenueAmount: revenueAmount,
      revenueSource: revenueSource,
      revenueDate: revenueDate,
      revenueUpdateDate: DateTime.now().toString(),
    );
    isar.writeTxn(() => isar.revenues.put(newRevenue));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gelir Ekle"),
      ),
      body: Material(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Gelir İsmi',
              ),
              onChanged: (value) {
                _formValues['revenueTitle'] = value.toString();
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Gelir Tutarı',
              ),
              onChanged: (value) {
                _formValues['revenueAmount'] = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Gelir Açıklaması',
              ),
              onChanged: (value) {
                _formValues['revenueDescription'] = value.toString();
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Gelir Kaynağı',
              ),
              onChanged: (value) {
                _formValues['revenueSource'] = value.toString();
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Gelir Tarihi',
              ),
              onChanged: (String value) {
                _formValues['expenseDate'] = value;
              },
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    _formValues['revenueDate'] =
                        DateFormat('yyyy-mM-dd').format(pickedDate);
                    _textEditingController.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                  });
                }
              },
              controller: _textEditingController,
            ),
            ElevatedButton(
              onPressed: () {
                addRevenue(
                  _formValues['revenueTitle'] ?? '',
                  _formValues['revenueDescription'] ?? '',
                  double.parse(_formValues['revenueAmount'] ?? '0'),
                  _formValues['revenueSource'] ?? '',
                  _formValues['revenueDate'] ??
                      DateFormat("dd-MM-yyyy").format(DateTime.now()),
                );
              },
              child: const Text('Geliri Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
