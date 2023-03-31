import 'package:butce_guru/widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconWidget(
              icon: Icons.arrow_upward,
              title: 'Gider Ekle',
              index: 0,
              currentIndex: currentIndex,
              onTabSelected: onTabSelected,
            ),
            CustomIconWidget(
              icon: Icons.account_balance_wallet,
              title: 'Varlıklarım',
              index: 1,
              currentIndex: currentIndex,
              onTabSelected: onTabSelected,
            ),
            CustomIconWidget(
              icon: Icons.arrow_downward,
              title: 'Gelir Ekle',
              index: 2,
              currentIndex: currentIndex,
              onTabSelected: onTabSelected,
            ),
          ],
        ),
      ),
    );
  }
}
