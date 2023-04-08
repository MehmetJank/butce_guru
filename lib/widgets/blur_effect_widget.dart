import 'package:flutter/material.dart';
import 'dart:ui';

class CustomBlurEffect extends StatelessWidget {
  const CustomBlurEffect({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 4,
        ),
        child: Container(
          color: Colors.black.withOpacity(0.1),
          child: child,
        ),
      ),
    );
  }
}
