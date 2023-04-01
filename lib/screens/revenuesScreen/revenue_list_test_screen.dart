import 'package:butce_guru/database/revenue.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class RevenueListScreen extends StatefulWidget {
  const RevenueListScreen({super.key});

  @override
  State<RevenueListScreen> createState() => _RevenueListScreenState();
}

class _RevenueListScreenState extends State<RevenueListScreen> {
  late final Isar isar;
  late List<Revenue> revenuesList = [];

  // openIsar() async {
  //   isar = await Isar.open([RevenueSchema]);
  //   listRevenues();
  // }

  // closeIsar() async {
  //   await isar.close();
  // }

  @override
  void initState() {
    // print("Init state methodunda isar açılıyor");
    super.initState();
    // openIsar();
    isar = Provider.of<Isar>(context, listen: false);
    listRevenues();
  }

  // @override
  // void dispose() {
  //   // print("dispose methodunda isar kapatılıyor");
  //   closeIsar();
  //   super.dispose();
  // }

  listRevenues() async {
    final revenues = await isar.revenues.where().findAll();
    setState(() {
      revenuesList = revenues;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gelirler"),
      ),
      body: Material(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: revenuesList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(revenuesList[index].revenueName),
                      subtitle: Text(revenuesList[index].revenueDescription),
                      trailing:
                          Text(revenuesList[index].revenueAmount.toString()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
