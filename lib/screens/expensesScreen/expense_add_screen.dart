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
  const ExpenseAddScreen({super.key});

  @override
  State<ExpenseAddScreen> createState() => _ExpenseAddScreenState();
}

class _ExpenseAddScreenState extends State<ExpenseAddScreen> {
  late final Isar isar;
  final _expenseTitleController = TextEditingController();
  final _expenseDescriptionController = TextEditingController();
  final _expenseAmountController = TextEditingController();
  final _expenseDateController = TextEditingController();
  final _expenseCategoryController = TextEditingController();
  final _paymentMethodController = TextEditingController();
  final _bankNameController = TextEditingController();

  int? id; //edit tusundan gelecek id

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as int?;
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

    isar.writeTxn(() => isar.expenses.put(newExpense));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Expense added'),
      ),
    );
  }

  void editExpense(int id) async {
    final expense = await isar.expenses.where().idEqualTo(id).findFirst();
    if (expense != null) {
      _expenseTitleController.text = expense.expenseTitle ?? '';
      _expenseDescriptionController.text = expense.expenseDescription ?? '';
      _expenseAmountController.text = expense.expenseAmount.toString();
      _expenseDateController.text = expense.expenseDate ?? '';
      _expenseCategoryController.text = expense.expenseCategory ?? '';
      _paymentMethodController.text = expense.paymentMethod ?? '';
      _bankNameController.text = expense.bankName ?? '';
    }
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
                title: id == null ? "Gider Ekle" : "Gider Güncelle",
                onPressBack: '/homeScreen',
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
                          onChanged: (value) {},
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
                          onChanged: (value) {},
                        ),
                        CustomTextFormField(
                          labelText: "Gider Açıklaması",
                          hintText: "Giderinizi istediginiz sekilde açıklayın!",
                          icon: Icons.description,
                          keyboardType: TextInputType.text,
                          controller: _expenseDescriptionController,
                          onChanged: (value) {},
                        ),
                        CustomTextFormField(
                          labelText: "Gider Tarihi",
                          hintText: "Gider tarihini girin!",
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
                            "Is",
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
                        Navigator.pushNamed(context, '/homeScreen');
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
