import 'dart:ui';
import 'package:flutter/material.dart';

import '../../widgets/background_widget.dart';
import '../../widgets/custom_app_bar.dart';
import 'charts/amount_chart.dart';
import 'charts/bank_name_method_chart.dart';
import 'charts/payment_method_chart.dart';

class MouseDraggableScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class ChartSlider extends StatefulWidget {
  const ChartSlider({super.key, this.startDate, this.endDate});
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<ChartSlider> createState() => _ChartSliderState();
}

class _ChartSliderState extends State<ChartSlider> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const CustomBackground(
                assetImage: "assets/backgrounds/chart_screen_background.jpg"),
            const CustomAppBar(
              title: 'Grafikler',
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: MouseDraggableScrollBehavior(),
                      child: PageView.builder(
                        itemCount: 3, // toplam sayfa sayısı
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,

                        onPageChanged: (index) {
                          setState(() {
                            _currentPageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return AmountChart(
                              startDate: widget.startDate,
                              endDate: widget.endDate,
                            );
                          } else if (index == 1) {
                            return PaymentMethodChart(
                              startDate: widget.startDate,
                              endDate: widget.endDate,
                            );
                          } else if (index == 2) {
                            // return CategoryChart(
                            //   startDate: widget.startDate,
                            //   endDate: widget.endDate,
                            // );
                            return BankNameMethodChart(
                              startDate: widget.startDate,
                              endDate: widget.endDate,
                            );
                          }
                          // else if (index == 3) {
                          //on build
                          //     // return CategoryChart(
                          //   startDate: widget.startDate,
                          //   endDate: widget.endDate,
                          // );
                          // }
                          else {
                            return const Center(
                              child: Text('No chart'),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDotIndicator(0),
                        const SizedBox(width: 5),
                        _buildDotIndicator(1),
                        const SizedBox(width: 5),
                        _buildDotIndicator(2),
                        // const SizedBox(width: 5),
                        // _buildDotIndicator(3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicator(int pageIndex) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pageIndex == _currentPageIndex
            ? const Color.fromARGB(255, 33, 243, 208)
            : Colors.grey.withOpacity(0.5),
      ),
    );
  }
}
