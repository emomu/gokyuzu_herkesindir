import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenHeightPercentage(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.height * percentage;
}

double screenWidthPercentage(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * percentage;
}

String formatDate(String dateString) {
  // String tarih verisini DateTime nesnesine dönüştürme
  DateTime dateTime = DateTime.parse(dateString);

  // İstediğiniz formatı ayarlayın: "19 Eylül 2024"
  String formattedDate = DateFormat('dd MMMM yyyy', 'tr_TR').format(dateTime);

  return formattedDate;
}

String formatTime(String dateString) {
  // String tarih verisini DateTime nesnesine dönüştürme
  DateTime dateTime = DateTime.parse(dateString);

  // Sadece saat ve dakikayı içeren formatı ayarlayın: "14:30"
  String formattedTime = DateFormat('HH:mm', 'tr_TR').format(dateTime);

  return formattedTime;
}

String formattedTutar(dynamic tutar) {
  final formatTutar = NumberFormat.decimalPattern('tr_TR').format(tutar);

  return formatTutar;
}

String formatTimeLocal(int seconds) {
  final minutes = (seconds ~/ 60).toString().padLeft(1, '0');
  final secs = (seconds % 60).toString().padLeft(2, '0');
  return "$minutes:$secs";
}
