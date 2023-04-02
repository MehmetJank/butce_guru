// import 'package:butce_guru/database/expenses.dart';
// import 'package:butce_guru/database/revenues.dart';
// import 'package:butce_guru/screens/test/my_transaction.dart';
// import 'package:flutter/material.dart';
// import 'package:isar/isar.dart';
// import 'package:provider/provider.dart';

// class GetFilter extends StatefulWidget {
//   const GetFilter({Key? key}) : super(key: key);

//   @override
//   State<GetFilter> createState() => _GetFilterState();
// }

// class _GetFilterState extends State<GetFilter> {
//   late final Isar isar;
//   late List<Expenses> expensesList = [];
//   late List<Revenues> revenuesList = [];
//   late Map<String, dynamic> transactionMap = {};
//   late int myItemCount = 0;

//   @override
//   void initState() {
//     super.initState();
//     isar = Provider.of<Isar>(context, listen: false);
//     listTransactions();
//   }

//   listTransactions() async {
//     final expenses = await isar.expenses.where().findAll();
//     final revenues = await isar.revenues.where().findAll();
//     setState(() {
//       expensesList = expenses;
//       revenuesList = revenues;
      
//       myItemCount = expensesList.length + revenuesList.length;
//     });
//   }

//   deleteTransaction(int id) async {
//     await isar.writeTxn(
//       () async {
//         bool result = await isar.expenses.delete(id);
//         if (result) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Gider Kaldırıldı")),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: const Text("Gider Bulunamadı")),
//           );
//         }
//       },
//     );
//     listTransactions();
//   }

//   Widget buildDetailText(String title, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '$title:',
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         Text(value.isEmpty ? 'Veri Yok' : value),
//         const SizedBox(height: 16),
//       ],
//     );
//   }

//   Widget checkEmpty(String title, String value) {
//     if (value == '') {
//       return Text('${title}Veri Yok');
//     } else {
//       return Text('$title$value');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Hareketler'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: MyTransaction(
//                   transactionName: 

//                 , money: , expenseOrIncome: ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
