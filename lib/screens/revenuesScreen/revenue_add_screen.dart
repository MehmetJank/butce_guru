import 'package:butce_guru/database/revenues.dart';
import 'package:butce_guru/widgets/background_widget.dart';
import 'package:butce_guru/widgets/custom_app_bar.dart';
import 'package:butce_guru/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class RevenueAddScreen extends StatefulWidget {
  const RevenueAddScreen({super.key});

  @override
  State<RevenueAddScreen> createState() => _RevenueAddScreenState();
}

class _RevenueAddScreenState extends State<RevenueAddScreen> {
  late final Isar isar;
  final _textEditingController = TextEditingController();

  final _formValues = <String, String>{};

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
  }

  addRevenue(
    String revenueTitle,
    String revenueDescription,
    double revenueAmount,
    String revenueSource,
    String revenueDate,
  ) async {
    final newRevenue = Revenues(
      revenueTitle: revenueTitle,
      revenueDescription: revenueDescription,
      revenueAmount: revenueAmount,
      revenueSource: revenueSource,
      revenueDate: revenueDate,
      revenueUpdateDate: DateTime.now().toString(),
    );
    isar.writeTxn(() => isar.revenues.put(newRevenue));
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
              const CustomAppBar(
                title: "Gelir Ekle",
                onPressBack: "/homeScreen",
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
                      onChanged: (value) {
                        _formValues['revenueTitle'] = value.toString();
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Gelir Tutarı",
                      hintText: "Gelir Tutarını Girin",
                      icon: Icons.attach_money,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _formValues['revenueAmount'] = value;
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Gelir Açıklaması",
                      hintText: "Gelir Açıklamasını Girin",
                      icon: Icons.description,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        _formValues['revenueDescription'] = value.toString();
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Gelir Kaynağı",
                      hintText: "Gelir Kaynağını Girin",
                      icon: Icons.source,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        _formValues['revenueSource'] = value.toString();
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Gelir Tarihi",
                      hintText:
                          "Gelir Tarihini Girin Bugunun Tarihini Girmek Icin Bos Birakin",
                      icon: Icons.date_range,
                      keyboardType: TextInputType.datetime,
                      onChanged: (value) {
                        _formValues['revenueDate'] = value.toString();
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
                                DateFormat('yyyy-mM-dd').format(pickedDate);
                            _textEditingController.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      },
                      controller: _textEditingController,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addRevenue(
                          _formValues['revenueTitle'] ?? '',
                          _formValues['revenueDescription'] ?? '',
                          double.parse(_formValues['revenueAmount'] ?? '0'),
                          _formValues['revenueSource'] ?? '',
                          _formValues['revenueDate'] ??
                              DateFormat("dd-MM-yyyy").format(DateTime.now()),
                        );
                        Navigator.pushNamed(context, '/homeScreen');
                      },
                      child: const Text(
                        'Geliri Ekle',
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
