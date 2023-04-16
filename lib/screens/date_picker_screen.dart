import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/background_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_range_picker.dart';

class DatePicker extends StatelessWidget {
  DatePicker({Key? key}) : super(key: key);

  late final ValueNotifier<DateTime?> startDate = ValueNotifier(null);
  late final ValueNotifier<DateTime?> endDate = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const CustomBackground(
              assetImage: "assets/backgrounds/date_picker_background.jpg",
            ),
            const CustomAppBar(
              title: 'Tablolarınız Hangi Tarih Aralığında Gösterilsin?',
            ),
            Positioned.fill(
              top: kToolbarHeight + 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: CustomRangePicker(
                        onDateRangeSelected: (start, end) {
                          startDate.value = start;
                          endDate.value = end;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.push(
                          '/charts/${startDate.value}/${endDate.value}',
                        );
                      },
                      child: const Text('Göster'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
