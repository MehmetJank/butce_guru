import 'package:butce_guru/constants/color.dart';
import 'package:flutter/material.dart';

class CustomIconWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final int index;
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomIconWidget({
    required this.icon,
    required this.title,
    required this.index,
    required this.currentIndex,
    required this.onTabSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomIconWidget> createState() => _CustomIconWidgetState();
}

class _CustomIconWidgetState extends State<CustomIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            widget.onTabSelected(widget.index);
          },
          icon: Icon(
            widget.icon,
            color: widget.index == widget.currentIndex
                ? AppColors.primaryColor
                : Colors.grey,
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            color: widget.index == widget.currentIndex
                ? AppColors.primaryColor
                : Colors.grey,
          ),
        ),
      ],
    );
  }
}
