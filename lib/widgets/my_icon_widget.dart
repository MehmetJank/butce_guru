import 'package:butce_guru/constants/color.dart';
import 'package:flutter/material.dart';

class MyIconWidget extends StatefulWidget {
  const MyIconWidget({super.key});

  @override
  State<MyIconWidget> createState() => _MyIconWidgetState();
}

class _MyIconWidgetState extends State<MyIconWidget> {
  late int index;
  late String title;
  late IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              index;
            });
          },
          icon: Icon(
            Icons.arrow_upward,
            color: index == 2 ? AppColors.primaryColor : Colors.grey,
          ),
        ),
        Text(
          'Giderler',
          style: TextStyle(
            fontSize: 16,
            color: index == 2 ? AppColors.primaryColor : Colors.grey,
          ),
        ),
      ],
    );
  }
}
