import 'package:butce_guru/database/expenses.dart';
import 'package:butce_guru/database/revenues.dart';
import 'package:butce_guru/screens/homeScreen/functions.dart';
import 'package:butce_guru/widgets/background_widget.dart';
import 'package:butce_guru/widgets/balance_card_widget.dart';
import 'package:butce_guru/widgets/blur_effect_widget.dart';
import 'package:butce_guru/widgets/check_empty_widget.dart';
import 'package:butce_guru/widgets/custom_plus_button.dart';
import 'package:butce_guru/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Isar isar;
  bool _listLoading = true;
  bool _amountLoading = true;
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

    listTransactionsAndAddToList();
    _calculateNetAmount();
  }

  listTransactionsAndAddToList() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final expenses = await isar.expenses.where().findAll();
    final revenues = await isar.revenues.where().findAll();

    mergedList.clear(); // clear the list before adding new items
    for (var expense in expenses) {
      mergedList.add(
        {
          "id": expense.id,
          "type": "expenses",
          "title": expense.expenseTitle,
          "amount": expense.expenseAmount,
          "description": expense.expenseDescription,
          "date": expense.expenseDate,
          "category": expense.expenseCategory,
          "payment": expense.paymentMethod,
          "bankName": expense.bankName,
        },
      );
    }

    for (var revenue in revenues) {
      mergedList.add(
        {
          "id": revenue.id,
          "type": "revenues",
          "title": revenue.revenueTitle,
          "amount": revenue.revenueAmount,
          "description": revenue.revenueDescription,
          "date": revenue.revenueDate,
          "source": revenue.revenueSource,
        },
      );
    }
    mergedList.sort((a, b) => b["date"].compareTo(a["date"]));

    setState(() {
      _listLoading = false;
    });
  }

  deleteTransaction(int id, String type) async {
    await isar.writeTxn(
      () async {
        if (type == "expenses") {
          bool result = await isar.expenses.delete(id);
          if (result) {}
        } else if (type == "revenues") {
          bool result = await isar.revenues.delete(id);
          if (result) {}
        }
      },
    );
    listTransactionsAndAddToList();
    _calculateNetAmount();
  }

  editTransaction(int id, String type) async {
    if (type == "expenses") {
      Navigator.pushNamed(
        context,
        '/expense/add',
        arguments: id,
      );
    } else if (type == "revenues") {
      Navigator.pushNamed(
        context,
        '/revenue/add',
        arguments: id,
      );
    }
  }

  Future<void> _calculateNetAmount() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final netAmount = await calculateNetAmount(context, isar);
    final totalRevenueAmount = await getTotalRevenueAmount(isar);
    final totalExpenseAmount = await getTotalExpenseAmount(isar);
    setState(
      () {
        _netAmount = netAmount;
        _totalRevenueAmount = totalRevenueAmount;
        _totalExpenseAmount = totalExpenseAmount;
        _amountLoading = false;
      },
    );
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
                  amountLoading: _amountLoading,
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: _listLoading
                              ? const Center(
                                  child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator()),
                                )
                              : ListView.separated(
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
                                            return CustomBlurEffect(
                                              child: AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                title: Text(item["title"]),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CheckEmpty(
                                                        title: "Miktar: ",
                                                        value: item["amount"]
                                                            .toString()),
                                                    CheckEmpty(
                                                        title: "Açıklama: ",
                                                        value: item[
                                                            "description"]),
                                                    CheckEmpty(
                                                        title: "Tarih: ",
                                                        value: item["date"]),
                                                    CheckEmpty(
                                                        title: "Kategori: ",
                                                        value:
                                                            item["category"] ??
                                                                ""),
                                                    CheckEmpty(
                                                        title:
                                                            "Ödeme Yöntemi: ",
                                                        value:
                                                            item["payment"] ??
                                                                ""),
                                                    CheckEmpty(
                                                        title: "Banka: ",
                                                        value:
                                                            item["bankName"] ??
                                                                ""),
                                                    CheckEmpty(
                                                        title: "Kaynak: ",
                                                        value: item["source"] ??
                                                            "")
                                                  ],
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      deleteTransaction(
                                                          item["id"],
                                                          item["type"]);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      editTransaction(
                                                          item["id"],
                                                          item["type"]);
                                                    },
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
                                            );
                                          },
                                        );
                                      },
                                      child: transactionWidget(item),
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
            // const CustomPlusButton(),
          ],
        ),
        floatingActionButton: const CustomPlusButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
      ),
    );
  }
}
