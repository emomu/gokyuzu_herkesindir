import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  static const int maxDay = 31;
  static const int minDay = 1;
  static const int maxMonth = 12;
  static const int minMonth = 1;
  static const int maxYear = 2024;
  static const int minYear = 1910;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.length > 8) {
      digitsOnly = digitsOnly.substring(0, 8);
    }

    String day = '';
    String month = '';
    String year = '';
    String formatted = '';
    int selectionIndex = newValue.selection.end;

    if (digitsOnly.length >= 2) {
      day = digitsOnly.substring(0, 2);
      int dayValue = int.tryParse(day) ?? 0;
      if (dayValue > maxDay) dayValue = maxDay;
      if (dayValue < minDay) dayValue = minDay;
      day = dayValue.toString().padLeft(2, '0');
      formatted += day;
    } else {
      formatted += digitsOnly;
    }

    if (digitsOnly.length > 2) {
      formatted += '/';
      if (digitsOnly.length >= 4) {
        month = digitsOnly.substring(2, 4);
        int monthValue = int.tryParse(month) ?? 0;
        if (monthValue > maxMonth) monthValue = maxMonth;
        if (monthValue < minMonth) monthValue = minMonth;
        month = monthValue.toString().padLeft(2, '0');
        formatted += month;
      } else {
        formatted += digitsOnly.substring(2);
      }
    }

    if (digitsOnly.length > 4) {
      formatted += '/';
      if (digitsOnly.length >= 8) {
        year = digitsOnly.substring(4, 8);
        int yearValue = int.tryParse(year) ?? 0;
        if (yearValue > maxYear) yearValue = maxYear;
        if (yearValue < minYear) yearValue = minYear;
        year = yearValue.toString();
        formatted += year;
      } else {
        formatted += digitsOnly.substring(4);
      }
    }
    selectionIndex = formatted.length;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
