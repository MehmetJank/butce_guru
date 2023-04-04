import 'package:flutter/material.dart';

class CheckEmpty extends StatelessWidget {
  const CheckEmpty({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    if (value == '' || value == "null") {
      return Text('${title}Veri Yok');
    } else {
      return Text('$title$value');
    }
  }
}
