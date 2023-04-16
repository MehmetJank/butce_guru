import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../constants/color.dart';

class CustomRangePicker extends StatelessWidget {
  const CustomRangePicker({
    Key? key,
    required void Function(DateTime?, DateTime?) onDateRangeSelected,
  })  : _onDateRangeSelected = onDateRangeSelected,
        super(key: key);

  final void Function(DateTime?, DateTime?) _onDateRangeSelected;

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      monthViewSettings: const DateRangePickerMonthViewSettings(
        showTrailingAndLeadingDates: false,
        dayFormat: 'EEE',
        firstDayOfWeek: 1,
        viewHeaderStyle: DateRangePickerViewHeaderStyle(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      headerHeight: 50,
      headerStyle: const DateRangePickerHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      yearCellStyle: DateRangePickerYearCellStyle(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        todayTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        todayCellDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.secondaryColor,
            width: 2,
          ),
        ),
        cellDecoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        leadingDatesDecoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
      ),
      monthFormat: 'MMMM',
      monthCellStyle: DateRangePickerMonthCellStyle(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        todayTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        todayCellDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.secondaryColor,
            width: 2,
          ),
        ),
        blackoutDateTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cellDecoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        weekendTextStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 16,
        ),
      ),
      rangeTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      selectionShape: DateRangePickerSelectionShape.circle,
      startRangeSelectionColor: AppColors.primaryColor,
      endRangeSelectionColor: AppColors.primaryColor,
      selectionRadius: 20,
      selectionColor: AppColors.primaryColor,
      rangeSelectionColor: AppColors.primaryColor.withOpacity(0.5),
      selectionTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      toggleDaySelection: true,
      showTodayButton: true,
      todayHighlightColor: AppColors.primaryColor,
      view: DateRangePickerView.month,
      selectionMode: DateRangePickerSelectionMode.range,
      onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
        _onDateRangeSelected(args.value.startDate, args.value.endDate);
      },
    );
  }
}
