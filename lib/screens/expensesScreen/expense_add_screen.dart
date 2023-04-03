import 'package:butce_guru/database/expenses.dart';
import 'package:butce_guru/widgets/background_widget.dart';
import 'package:butce_guru/widgets/custom_app_bar.dart';
import 'package:butce_guru/widgets/custom_drop_down_button.dart';
import 'package:butce_guru/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import '../../constants/color.dart';

class ExpenseAddScreen extends StatefulWidget {
  const ExpenseAddScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseAddScreen> createState() => _ExpenseAddScreenState();
}

class _ExpenseAddScreenState extends State<ExpenseAddScreen> {
  late final Isar isar;
  final _textEditingController = TextEditingController();

  final _formValues = <String, String>{};

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
  }

  addExpense(
    String expenseTitle,
    String expenseDescription,
    double expenseAmount,
    String expenseDate,
    String expenseCategory,
    String paymentMethod,
    String bankName,
  ) async {
    if (expenseAmount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Amount must be a positive number'),
        ),
      );
      return;
    }
    if (expenseTitle.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gider Adi boş olamaz!'),
        ),
      );
      return;
    }
    final newExpense = Expenses(
      expenseTitle: expenseTitle,
      expenseDescription: expenseDescription,
      expenseAmount: expenseAmount,
      expenseDate: expenseDate,
      expenseUpdateDate: DateTime.now().toString(),
      expenseCategory: expenseCategory,
      paymentMethod: paymentMethod,
      bankName: bankName,
    );
    isar.writeTxn(() => isar.expenses.put(newExpense));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Expense added'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const CustomBackground(
                assetImage: "assets/backgrounds/expense_screen_background.jpg",
              ),
              const CustomAppBar(
                title: "Gider Ekle",
                onPressBack: "/homeScreen",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 65, 20, 0),
                child: Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                          CustomTextFormField(
                            labelText: "Gider Adı",
                            hintText: "Gideri istediğiniz şekilde adlandırın!",
                            icon: Icons.label,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _formValues['expenseTitle'] = value;
                            },
                          ),
                          CustomTextFormField(
                            labelText: "Gider Tutarı",
                            hintText: "Gider tutarını girin!",
                            icon: Icons.attach_money,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              _formValues['expenseAmount'] = value;
                            },
                          ),
                          CustomTextFormField(
                            labelText: "Gider Açıklaması",
                            hintText:
                                "Giderinizi istediginiz sekilde açıklayın!",
                            icon: Icons.description,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _formValues['expenseDescription'] = value;
                            },
                          ),
                          CustomTextFormField(
                            labelText: "Gider Tarihi",
                            hintText: "Gider tarihini girin!",
                            icon: Icons.date_range,
                            keyboardType: TextInputType.datetime,
                            onChanged: (String value) {
                              _formValues['expenseDate'] = value;
                            },
                            onTap: (String) async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  _formValues['expenseDate'] =
                                      DateFormat('yyyy-mM-dd')
                                          .format(pickedDate);
                                  _textEditingController.text =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                });
                              }
                            },
                            controller: _textEditingController,
                          ),
                          CustomDropDownButton(
                            name: "Gider Kategorisi",
                            hint: ('Seçiniz'),
                            items: const [
                              'Yemek',
                              'Ulaşım',
                              'Giyim',
                              'Sağlık',
                              'Eğitim',
                              'Eğlence',
                              'Spor',
                              'Ev',
                              'Diğer',
                            ],
                            onChanged: (value) {
                              _formValues['expenseCategory'] = value.toString();
                            },
                          ),
                          CustomDropDownButton(
                            name: "Ödeme Yöntemi",
                            hint: ('Seçiniz'),
                            items: const [
                              'Nakit',
                              'Kredi Kartı',
                              'Banka Kartı',
                            ],
                            onChanged: (value) {
                              _formValues['paymentMethod'] = value.toString();
                            },
                          ),
                          CustomDropDownButton(
                            name: "Banka Adı",
                            hint: ('Seçiniz'),
                            items: const [
                              "Garanti BNK.",
                              "Is BNK.",
                              "Yapi Kredi BNK.",
                              "Ziraat BNK.",
                              "Akbank",
                              "Halkbank",
                              "Denizbank",
                              "Finansbank",
                              "ING Bank",
                              "T.C. Ziraat BNK.",
                              "Kuveyt Turk BNK.",
                              "Vakifbank",
                              "Anadolubank",
                            ],
                            onChanged: (value) {
                              _formValues['bankName'] = value.toString();
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.primaryColor.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 50,
                        ),
                        minimumSize: const Size(200, 50),
                      ),
                      onPressed: () {
                        addExpense(
                          _formValues['expenseTitle'] ?? '',
                          _formValues['expenseDescription'] ?? '',
                          double.parse(_formValues['expenseAmount'] ?? '0'),
                          _formValues['expenseDate'] ??
                              DateFormat("dd-MM-yyyy").format(DateTime.now()),
                          _formValues['expenseCategory'] ?? '',
                          _formValues['paymentMethod'] ?? '',
                          _formValues['bankName'] ?? '',
                        );
                        Navigator.pushNamed(context, '/homeScreen');
                      },
                      child: const Text(
                        'Gider Ekle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
