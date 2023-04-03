import 'package:butce_guru/constants/color.dart';
import 'package:butce_guru/database/revenues.dart';
import 'package:butce_guru/widgets/background_widget.dart';
import 'package:butce_guru/widgets/custom_app_bar.dart';
import 'package:butce_guru/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final _revenueTitleController = TextEditingController();
  final _revenueDescriptionController = TextEditingController();
  final _revenueAmountController = TextEditingController();
  final _revenueSourceController = TextEditingController();
  final _revenueDateController = TextEditingController();

  int? id;

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
        content: Text('Revenue added'),
      ),
    );
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
                title: id == null ? 'Geliri Ekle' : 'Geliri Güncelle',
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
                      controller: _revenueTitleController,
                      onChanged: (value) {},
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
                      onChanged: (value) {},
                    ),
                    CustomTextFormField(
                      labelText: "Gelir Açıklaması",
                      hintText: "Gelir Açıklamasını Girin",
                      icon: Icons.description,
                      keyboardType: TextInputType.text,
                      controller: _revenueDescriptionController,
                      onChanged: (value) {},
                    ),
                    CustomTextFormField(
                      labelText: "Gelir Kaynağı",
                      hintText: "Gelir Kaynağını Girin",
                      icon: Icons.source,
                      keyboardType: TextInputType.text,
                      controller: _revenueSourceController,
                      onChanged: (value) {},
                    ),
                    CustomTextFormField(
                      labelText: "Gelir Tarihi",
                      hintText:
                          "Gelir Tarihini Girin Bugunun Tarihini Girmek Icin Bos Birakin",
                      icon: Icons.date_range,
                      keyboardType: TextInputType.datetime,
                      controller: _revenueDateController,
                      onChanged: (value) {},
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
                        Navigator.pushNamed(context, '/homeScreen');
                      },
                      child: Text(
                        id == null ? 'Geliri Ekle' : 'Geliri Güncelle',
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
