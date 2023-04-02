import 'package:butce_guru/database/expenses.dart';
import 'package:butce_guru/database/revenues.dart';
import 'package:butce_guru/screens/test/my_transaction.dart';
import 'package:butce_guru/screens/test/top_card.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late final Isar isar;
  late List<Expenses> expensesList = [];
  double _netAmount = 0.0;
  double _totalRevenueAmount = 0.0;
  double _totalExpenseAmount = 0.0;

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
    _calculateNetAmount();
    listExpenses();
  }

  listExpenses() async {
    final expenses = await isar.expenses.where().findAll();
    setState(() {
      expensesList = expenses;
    });
  }

  deleteExpense(int id) async {
    await isar.writeTxn(
      () async {
        bool result = await isar.expenses.delete(id);
        if (result) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Gider Kaldırıldı")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text("Gider Bulunamadı")),
          );
        }
      },
    );
    listExpenses();
  }

  Future<void> _calculateNetAmount() async {
    final netAmount = await calculateNetAmount(context, isar);
    final totalRevenueAmount = await getTotalRevenueAmount(isar);
    final totalExpenseAmount = await getTotalExpenseAmount(isar);
    setState(() {
      _netAmount = netAmount;
      _totalRevenueAmount = totalRevenueAmount;
      _totalExpenseAmount = totalExpenseAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopNeuCard(
              balance: _netAmount.toString(),
              expense: _totalExpenseAmount.toString(),
              income: _totalRevenueAmount.toString(),
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return MyTransaction(
                            transactionName: "Transaction Name",
                            money: "100",
                            expenseOrIncome: "expense",
                          );
                        },
                        itemCount: 10,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
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
