import 'package:butce_guru/constants/color.dart';
import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({
    Key? key,
    this.value,
    required this.onChanged,
    required this.items,
    required this.hint,
    required this.name,
  }) : super(key: key);

  final String? value;
  final void Function(String?)? onChanged;
  final List<String> items;
  final String? hint;
  final String name;

  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String? currentSelectedValue;

  @override
  void initState() {
    super.initState();
    currentSelectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white54,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.name} :",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            DropdownButton<String>(
              value: currentSelectedValue,
              icon: const Icon(Icons.arrow_downward),
              hint: Text(
                widget.hint!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              iconEnabledColor: AppColors.primaryColor,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryColor,
              ),
              dropdownColor:
                  Colors.white, // Arka plan rengini beyaz olarak ayarlar
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  currentSelectedValue = newValue;
                });
                widget.onChanged!(newValue);
              },
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
