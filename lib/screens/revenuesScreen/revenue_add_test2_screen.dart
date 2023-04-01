import 'package:butce_guru/database/revenue.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class RevenueAddScreen extends StatefulWidget {
  const RevenueAddScreen({super.key});

  @override
  State<RevenueAddScreen> createState() => _RevenueAddScreenState();
}

class _RevenueAddScreenState extends State<RevenueAddScreen> {
  late final Isar isar;

  final _formValues = <String, String>{};

  // openIsar() async {
  //   isar = await Isar.open([RevenueSchema]);
  //   setState(() {
  //     print("isar açıldı");
  //   });
  // }

  // closeIsar() async {
  //   await isar.close();
  // }

  @override
  void initState() {
    // print("Init state methodunda isar açılıyor");
    // openIsar();
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
  }

  // @override
  // void dispose() {
  //   // print("dispose methodunda isar kapatılıyor");
  //   closeIsar();
  //   super.dispose();
  // }

  addRevenue(
    String revenueName,
    String revenueDescription,
    double revenueAmount,
    String revenueDate,
    String revenueCategory,
  ) async {
    final revenue = Revenue(
      revenueName: revenueName,
      revenueDescription: revenueDescription,
      revenueAmount: revenueAmount,
      revenueDate: revenueDate,
      revenueCategory: revenueCategory,
    );
    isar.writeTxn(() => isar.revenues.put(revenue));
    setState(() {
      print("Gelir eklendi");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gelir Ekle"),
      ),
      body: Material(
        child: Container(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Gelir İsmi',
                ),
                onSaved: (value) {
                  _formValues['revenueName'] = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Gelir Açıklaması',
                ),
                onSaved: (value) {
                  _formValues['revenueDescription'] = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Gelir Tutarı',
                ),
                onSaved: (value) {
                  _formValues['revenueAmount'] = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Gelir Tarihi',
                ),
                onSaved: (value) {
                  _formValues['revenueDate'] = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Gelir Kategorisi',
                ),
                onSaved: (value) {
                  _formValues['revenueCategory'] = value!;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  addRevenue(
                    _formValues['revenueName'] ?? '',
                    _formValues['revenueDescription'] ?? '',
                    double.parse(_formValues['revenueAmount'] ?? '0'),
                    _formValues['revenueDate'] ?? '',
                    _formValues['revenueCategory'] ?? '',
                  );
                },
                child: const Text('Geliri Ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
