import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../../constants/color.dart';
import '../../database/revenues.dart';
import '../../widgets/background_widget.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';

class RevenueAddScreen extends StatefulWidget {
  const RevenueAddScreen({super.key, this.editID});
  final String? editID;

  @override
  State<RevenueAddScreen> createState() => _RevenueAddScreenState();
}

class _RevenueAddScreenState extends State<RevenueAddScreen> {
  late final Isar isar;
  final _revenueTitleController = TextEditingController();
  final _revenueDescriptionController = TextEditingController();
  final _revenueAmountController = TextEditingController();
  final _revenueSourceController = TextEditingController();
  final _revenueDateController = TextEditingController();

  int? id; //for editID

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
    id = int.tryParse(widget.editID!);
    if (id != null) {
      editRevenue(id!);
    }
  }

  addRevenue(
    int id,
    String revenueTitle,
    String revenueDescription,
    double revenueAmount,
    String revenueSource,
    String revenueDate,
  ) async {
    final newRevenue = Revenues();
    newRevenue.id = id;
    newRevenue.revenueTitle = revenueTitle;
    newRevenue.revenueDescription = revenueDescription;
    newRevenue.revenueAmount = revenueAmount;
    newRevenue.revenueSource = revenueSource;
    newRevenue.revenueDate = revenueDate;

    isar.writeTxn(() => isar.revenues.put(newRevenue));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Gelir Eklendi'),
        backgroundColor: Colors.green,
      ),
    );
  }

  bool checkEmptyFields() {
    if (_revenueTitleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gelir başlığı boş olamaz!'),
          backgroundColor: Colors.red,
        ),
      );
      return true;
    }

    if (_revenueAmountController.text.isEmpty ||
        double.parse(_revenueAmountController.text) <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gelir Tutarı boş veya 0 olamaz!'),
          backgroundColor: Colors.red,
        ),
      );
      return true;
    }
    return false;
  }

  void editRevenue(int id) async {
    final revenueToEdit = await isar.revenues.get(id);

    setState(() {
      _revenueTitleController.text = revenueToEdit?.revenueTitle ?? '';
      _revenueDescriptionController.text =
          revenueToEdit?.revenueDescription ?? '';
      _revenueAmountController.text =
          revenueToEdit?.revenueAmount.toString() ?? '';
      _revenueSourceController.text = revenueToEdit?.revenueSource ?? '';
      _revenueDateController.text = revenueToEdit?.revenueDate ?? '';
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
                assetImage: 'assets/backgrounds/revenue_screen_background.jpg',
              ),
              CustomAppBar(
                title: id == null ? 'Gelir Ekle' : 'Geliri Güncelle',
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 65, 20, 0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      labelText: "Gelir Adı",
                      hintText: "Geliri Istediginiz Sekilde Adlandirin",
                      icon: Icons.label,
                      keyboardType: TextInputType.text,
                      controller: _revenueTitleController,
                    ),
                    CustomTextFormField(
                      labelText: "Gelir Tutarı",
                      hintText: "Gelir Tutarını Girin",
                      icon: Icons.attach_money,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: _revenueAmountController,
                    ),
                    CustomTextFormField(
                      labelText: "Gelir Açıklaması",
                      hintText: "Gelir Açıklamasını Girin",
                      icon: Icons.description,
                      keyboardType: TextInputType.text,
                      controller: _revenueDescriptionController,
                    ),
                    CustomTextFormField(
                      labelText: "Gelir Kaynağı",
                      hintText: "Gelir Kaynağını Girin",
                      icon: Icons.source,
                      keyboardType: TextInputType.text,
                      controller: _revenueSourceController,
                    ),
                    CustomTextFormField(
                      labelText: "Gelir Tarihi",
                      hintText:
                          "Gelir Tarihini Girin Bugunun Tarihini Girmek Icin Bos Birakin",
                      icon: Icons.date_range,
                      keyboardType: TextInputType.datetime,
                      controller: _revenueDateController,
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
                              _revenueDateController.text =
                                  DateFormat("dd/MM/yyyy HH:mm:ss")
                                      .format(pickedDate);
                            },
                          );
                        } else {
                          setState(
                            () {
                              _revenueDateController.text = "";
                            },
                          );
                        }
                      },
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
                              ? await addRevenue(
                                  Isar.autoIncrement,
                                  _revenueTitleController.text,
                                  _revenueDescriptionController.text,
                                  double.parse(_revenueAmountController.text),
                                  _revenueSourceController.text,
                                  _revenueDateController.text.isEmpty == true
                                      ? DateFormat("dd/MM/yyyy HH:mm:ss")
                                          .format(DateTime.now())
                                      : _revenueDateController.text,
                                )
                              : await addRevenue(
                                  id!,
                                  _revenueTitleController.text,
                                  _revenueDescriptionController.text,
                                  double.parse(_revenueAmountController.text),
                                  _revenueSourceController.text,
                                  _revenueDateController.text.isEmpty == true
                                      ? DateFormat("dd/MM/yyyy HH:mm:ss")
                                          .format(DateTime.now())
                                      : _revenueDateController.text,
                                );
                          if (!mounted) return;
                          GoRouter.of(context).push('/HomeScreen');
                        }
                      },
                      child: Text(
                        id == null ? 'Gelir Ekle' : 'Geliri Güncelle',
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
