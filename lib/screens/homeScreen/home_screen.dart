import 'dart:ui';

import 'package:butce_guru/database/expenses.dart';
import 'package:butce_guru/database/revenues.dart';
import 'package:butce_guru/screens/expensesScreen/expense_add_screen.dart';
import 'package:butce_guru/widgets/background_widget.dart';
import 'package:butce_guru/widgets/balance_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class HomeScreenBirlestirmeTest extends StatefulWidget {
  const HomeScreenBirlestirmeTest({Key? key}) : super(key: key);

  @override
  State<HomeScreenBirlestirmeTest> createState() =>
      _HomeScreenBirlestirmeTestState();
}

class _HomeScreenBirlestirmeTestState extends State<HomeScreenBirlestirmeTest> {
  late final Isar isar;
  late List<Expenses> expensesList = [];
  late List<Revenues> revenuesList = [];
  List<Map<String, dynamic>> mergedList = [];

  double _netAmount = 0.0;
  double _totalRevenueAmount = 0.0;
  double _totalExpenseAmount = 0.0;

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
    addToList();
    listTransactions();
    _calculateNetAmount();
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
      mergedList.add(
        {
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
        },
      );
    }

    for (var revenue in revenuesList) {
      mergedList.add(
        {
          "id": revenue.id,
          "type": "revenues",
          "title": revenue.revenueTitle,
          "amount": revenue.revenueAmount,
          "description": revenue.revenueDescription,
          "date": revenue.revenueDate,
          "updateDate": revenue.revenueUpdateDate,
          "source": revenue.revenueSource,
        },
      );
    }
    mergedList.sort((a, b) => b["updateDate"].compareTo(a["updateDate"]));
  }

  Future<void> _calculateNetAmount() async {
    final netAmount = await calculateNetAmount(context, isar);
    final totalRevenueAmount = await getTotalRevenueAmount(isar);
    final totalExpenseAmount = await getTotalExpenseAmount(isar);
    setState(
      () {
        _netAmount = netAmount;
        _totalRevenueAmount = totalRevenueAmount;
        _totalExpenseAmount = totalExpenseAmount;
      },
    );
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
        body: Stack(
          children: [
            const CustomBackground(
                assetImage: "assets/backgrounds/home_screen_background.jpg"),
            Column(
              children: [
                BalanceCard(
                  balance: _netAmount.toString(),
                  expense: _totalExpenseAmount.toString(),
                  income: _totalRevenueAmount.toString(),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: mergedList.length,
                            itemBuilder: (context, index) {
                              final item = mergedList[index];
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 4,
                                          sigmaY: 4,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            child: AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              title: Text(item["title"]),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  checkEmpty(
                                                      "Miktar: ",
                                                      item["amount"]
                                                          .toString()),
                                                  checkEmpty("Açıklama: ",
                                                      item["description"]),
                                                  checkEmpty(
                                                      "Tarih: ", item["date"]),
                                                  checkEmpty("Kategori: ",
                                                      item["category"] ?? ""),
                                                  checkEmpty("Ödeme Yöntemi: ",
                                                      item["payment"] ?? ""),
                                                  checkEmpty("Banka: ",
                                                      item["bankName"] ?? ""),
                                                  checkEmpty("Kaynak: ",
                                                      item["source"] ?? "")
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: Colors.red),
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
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(6, 1, 6, 1),
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color: Colors.white24.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.grey[300],
                                            child: Center(
                                              child: Text(
                                                item["title"][0],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item["title"],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              Text(
                                                item["date"].toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${item["amount"]} ₺",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: item["type"] == "expenses"
                                              ? Colors.red.shade900
                                              : Colors.green.shade900,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 4,
                          sigmaY: 4,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.black.withOpacity(0.1),
                            child: AlertDialog(
                              title: const Center(
                                child: Text('Add Transaction'),
                              ),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/revenue/add');
                                    },
                                    child: const Text('Revenue'),
                                  ),
                                  const Text(
                                    'OR',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/expense/add');
                                    },
                                    child: const Text('Expense'),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<double> calculateNetAmount(BuildContext context, Isar isar) async {
  double totalRevenueAmount = await getTotalRevenueAmount(isar);
  double totalExpenseAmount = await getTotalExpenseAmount(isar);
  return totalRevenueAmount - totalExpenseAmount;
}

Future<double> getTotalRevenueAmount(Isar isar) async {
  double totalRevenueAmount = 0.0;
  final revenues = isar.revenues;
  final revenueList = await revenues.where().findAll();
  for (var revenue in revenueList) {
    totalRevenueAmount += revenue.revenueAmount;
  }
  return totalRevenueAmount;
}

Future<double> getTotalExpenseAmount(Isar isar) async {
  double totalExpenseAmount = 0.0;
  final expenses = isar.expenses;
  final expenseList = await expenses.where().findAll();
  for (var expense in expenseList) {
    totalExpenseAmount += expense.expenseAmount;
  }
  return totalExpenseAmount;
}
