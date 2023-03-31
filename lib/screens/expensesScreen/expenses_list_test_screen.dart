import 'package:butce_guru/constants/color.dart';
import 'package:butce_guru/database/expenses.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class ExpensesListScreen extends StatefulWidget {
  const ExpensesListScreen({Key? key}) : super(key: key);

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  late final Isar isar;
  late List<Expenses> expensesList = [];

  openIsar() async {
    isar = await Isar.open([ExpensesSchema]);
    listExpenses();
  }

  closeIsar() async {
    await isar.close();
  }

  @override
  void initState() {
    // print("Init state methodunda isar açılıyor");
    super.initState();
    openIsar();
  }

  @override
  void dispose() {
    // print("dispose methodunda isar kapatılıyor");
    closeIsar();
    super.dispose();
  }

  listExpenses() async {
    final expenses = await isar.expenses.where().findAll();
    setState(() {
      expensesList = expenses;
    });
  }

  //delete a expense with id from database
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

  Widget buildDetailText(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(value.isEmpty ? 'Veri Yok' : value),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget checkEmpty(
    String title,
    String value,
  ) {
    if (value == '') {
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
          title: const Text("Beautiful"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Giderleri Listele",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: expensesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(expensesList[index].name),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  checkEmpty(
                                    "Miktar: ",
                                    "${expensesList[index].amount} TL",
                                  ),
                                  checkEmpty(
                                    "Açıklama: ",
                                    expensesList[index].description,
                                  ),
                                  checkEmpty(
                                    "Tarih: ",
                                    expensesList[index].date,
                                  ),
                                  checkEmpty(
                                    "Kategori: ",
                                    expensesList[index].category,
                                  ),
                                  checkEmpty(
                                    "Ödeme Türü: ",
                                    expensesList[index].paymentMethod,
                                  ),
                                  checkEmpty(
                                    "Ödeme Yeri: ",
                                    expensesList[index].bankName,
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    deleteExpense(expensesList[index].id);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Sil'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                                  backgroundColor: AppColors.primaryColor,
                                  child: Text(
                                    expensesList[index].name[0],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      expensesList[index].name,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      expensesList[index].date,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "- ${expensesList[index].amount} TL",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red[800],
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
    );
  }
}
