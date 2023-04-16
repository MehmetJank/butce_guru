import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../constants/color.dart';
import '../database/expenses.dart';
import '../widgets/background_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drop_down_button.dart';
import '../widgets/custom_text_form_field.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key, this.editID});
  final String? editID;

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  late final Isar isar;
  final _expenseTitleController = TextEditingController();
  final _expenseDescriptionController = TextEditingController();
  final _expenseAmountController = TextEditingController();
  final _expenseDateController = TextEditingController();
  final _expenseCategoryController = TextEditingController();
  final _paymentMethodController = TextEditingController();
  final _bankNameController = TextEditingController();

  int? id; //for editID

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
    id = int.tryParse(widget.editID!);
    if (id != null) {
      editExpense(id!);
    }
  }

  addExpense(
    int id,
    String expenseTitle,
    String expenseDescription,
    double expenseAmount,
    String expenseDate,
    String expenseCategory,
    String paymentMethod,
    String bankName,
  ) async {
    final newExpense = Expenses();
    newExpense.id = id;
    newExpense.expenseTitle = expenseTitle;
    newExpense.expenseDescription = expenseDescription;
    newExpense.expenseAmount = expenseAmount;
    newExpense.expenseDate = expenseDate;
    newExpense.expenseCategory = expenseCategory;
    newExpense.paymentMethod = paymentMethod;
    newExpense.bankName = bankName;

    isar.writeTxn(() => isar.expenses.put(newExpense));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Gider Eklendi'),
        backgroundColor: Colors.green,
      ),
    );
  }

  bool checkEmptyFields() {
    if (_expenseTitleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gider başlığı boş olamaz!'),
          backgroundColor: Colors.red,
        ),
      );
      return true;
    }

    if (_expenseAmountController.text.isEmpty ||
        double.parse(_expenseAmountController.text) <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gider Tutarı boş veya 0 olamaz!'),
          backgroundColor: Colors.red,
        ),
      );
      return true;
    }
    return false;
  }

  void editExpense(int id) async {
    final expenseToEdit = await isar.expenses.get(id);

    setState(() {
      _expenseTitleController.text = expenseToEdit?.expenseTitle ?? '';
      _expenseDescriptionController.text =
          expenseToEdit?.expenseDescription ?? '';
      _expenseAmountController.text =
          expenseToEdit?.expenseAmount.toString() ?? '';
      _expenseDateController.text = expenseToEdit?.expenseDate ?? '';
      _expenseCategoryController.text = expenseToEdit?.expenseCategory ?? '';
      _paymentMethodController.text = expenseToEdit?.paymentMethod ?? '';
      _bankNameController.text = expenseToEdit?.bankName ?? '';
    });
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
              CustomAppBar(
                title: id == null ? "Gider Ekle" : "Gideri Güncelle",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 65, 20, 0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        CustomTextFormField(
                          labelText: "Gider Adı",
                          hintText: "Gideri istediğiniz şekilde adlandırın!",
                          icon: Icons.label,
                          keyboardType: TextInputType.text,
                          controller: _expenseTitleController,
                        ),
                        CustomTextFormField(
                          labelText: "Gider Tutarı",
                          hintText: "Gider tutarını girin!",
                          icon: Icons.attach_money,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: _expenseAmountController,
                        ),
                        CustomTextFormField(
                          labelText: "Gider Açıklaması",
                          hintText: "Giderinizi istediğiniz şekilde açıklayın!",
                          icon: Icons.description,
                          keyboardType: TextInputType.text,
                          controller: _expenseDescriptionController,
                        ),
                        CustomTextFormField(
                          labelText: "Gider Tarihi",
                          hintText:
                              "Gider Tarihini Girin Bugunun Tarihini Girmek Icin Bos Birakin",
                          icon: Icons.date_range,
                          keyboardType: TextInputType.datetime,
                          controller: _expenseDateController,
                          onTap: (dynamic) async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              setState(
                                () {
                                  _expenseDateController.text =
                                      DateFormat("dd/MM/yyyy HH:mm:ss")
                                          .format(pickedDate);
                                },
                              );
                            } else {
                              setState(
                                () {
                                  _expenseDateController.text =
                                      DateFormat("dd/MM/yyyy HH:mm:ss")
                                          .format(DateTime.now());
                                },
                              );
                            }
                          },
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
                            'Kişisel Bakım',
                            'Kira',
                            'Sigorta',
                            'Diğer',
                          ],
                          onChanged: (value) {
                            _expenseCategoryController.text = value.toString();
                          },
                        ),
                        CustomDropDownButton(
                          name: "Ödeme Yöntemi",
                          hint: ('Seçiniz'),
                          items: const [
                            'Nakit',
                            'Kredi Kartı',
                            'Banka Kartı',
                            'Havale',
                          ],
                          onChanged: (value) {
                            _paymentMethodController.text = value.toString();
                          },
                        ),
                        CustomDropDownButton(
                          name: "Banka Adı",
                          hint: ('Seçiniz'),
                          items: const [
                            "Garanti",
                            "İş",
                            "Yapi Kredi",
                            "Ziraat",
                            "Akbank",
                            "Halkbank",
                            "Denizbank",
                            "Finansbank",
                            "ING Bank",
                            "T.C. Ziraat",
                            "Kuveyt Turk",
                            "Vakifbank",
                            "Anadolubank",
                          ],
                          onChanged: (value) {
                            _bankNameController.text = value.toString();
                          },
                        )
                      ],
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
                      onPressed: () async {
                        if (!checkEmptyFields()) {
                          id == null
                              ? await addExpense(
                                  Isar.autoIncrement,
                                  _expenseTitleController.text,
                                  _expenseDescriptionController.text,
                                  double.parse(_expenseAmountController.text),
                                  _expenseDateController.text.isEmpty == true
                                      ? DateFormat("dd/MM/yyyy HH:mm:ss")
                                          .format(DateTime.now())
                                      : _expenseDateController.text,
                                  _expenseCategoryController.text,
                                  _paymentMethodController.text,
                                  _bankNameController.text,
                                )
                              : addExpense(
                                  id!,
                                  _expenseTitleController.text,
                                  _expenseDescriptionController.text,
                                  double.parse(_expenseAmountController.text),
                                  _expenseDateController.text.isEmpty == true
                                      ? DateFormat("dd/MM/yyyy HH:mm:ss")
                                          .format(DateTime.now())
                                      : _expenseDateController.text,
                                  _expenseCategoryController.text,
                                  _paymentMethodController.text,
                                  _bankNameController.text,
                                );
                          if (!mounted) return;
                          GoRouter.of(context).push('/HomeScreen');
                        }
                      },
                      child: Text(
                        id == null ? 'Gider Ekle' : "Gideri Güncelle",
                        style: const TextStyle(
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
