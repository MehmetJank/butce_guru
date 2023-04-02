import 'package:butce_guru/database/expenses.dart';
import 'package:butce_guru/database/revenues.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class GetFilter extends StatefulWidget {
  const GetFilter({Key? key}) : super(key: key);

  @override
  State<GetFilter> createState() => _GetFilterState();
}

class _GetFilterState extends State<GetFilter> {
  late final Isar isar;
  late List<Expenses> expensesList = [];
  late List<Revenues> revenuesList = [];
  List<Map<String, dynamic>> mergedList = [];

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
    addToList();
    listTransactions();
  }

  listTransactions() async {
    final expenses = await isar.expenses.where().findAll();
    final revenues = await isar.revenues.where().findAll();
    setState(() {
      expensesList = expenses;
      revenuesList = revenues;
      addToList();
    });
  }

  addToList() {
    mergedList.clear(); // clear the list before adding new items
    for (var expense in expensesList) {
      mergedList.add({
        "id": expense.id,
        "type": "expenses",
        "title": expense.expenseTitle,
        "amount": expense.expenseAmount,
        "description": expense.expenseDescription,
        "date": expense.expenseDate,
        "updateDate": expense.expenseUpdateDate,
        "category": expense.expenseCategory,
        "payment": expense.paymentMethod,
        "bankName": expense.bankName,
      });
    }

    for (var revenue in revenuesList) {
      mergedList.add({
        "id": revenue.id,
        "type": "revenues",
        "title": revenue.revenueTitle,
        "amount": revenue.revenueAmount,
        "description": revenue.revenueDescription,
        "date": revenue.revenueDate,
        "updateDate": revenue.revenueUpdateDate,
        "source": revenue.revenueSource,
      });
    }
    mergedList.sort((a, b) => b["updateDate"].compareTo(a["updateDate"]));
  }

  Widget checkEmpty(
    String title,
    String value,
  ) {
    if (value == '' || value == "null") {
      return Text('${title}Veri Yok');
    } else {
      return Text('$title$value');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Get Filter'),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: mergedList.length,
          itemBuilder: (context, index) {
            final item = mergedList[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(item["title"]),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            checkEmpty("Miktar: ", item["amount"].toString()),
                            checkEmpty("Açıklama: ", item["description"]),
                            checkEmpty("Tarih: ", item["date"]),
                            checkEmpty("Kategori: ", item["category"] ?? ""),
                            checkEmpty(
                                "Ödeme Yöntemi: ", item["payment"] ?? ""),
                            checkEmpty("Banka: ", item["bankName"] ?? ""),
                            checkEmpty("Kaynak: ", item["source"] ?? "")
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Edit'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Ok',
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white38.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(item["title"][0]),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["title"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              item["date"].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      item["amount"].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: item["type"] == "expenses"
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
