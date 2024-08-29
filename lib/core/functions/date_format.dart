import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

String formatDate(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDate;
}

// String formatDate(String dateTimeString , String  lang ) {
//   DateTime dateTime = DateTime.parse(dateTimeString);

//   String formattedDate = DateFormat('d MMMM yyyy', lang).format(dateTime);

//   return formattedDate;
// }

String formatDate2(String dateTimeString) {
  DateFormat inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
  DateTime dateTime = inputFormat.parse(dateTimeString);
  DateFormat outputFormat = DateFormat('yyyy-MM-dd');
  String formattedDate = outputFormat.format(dateTime);
  return formattedDate;
}

String formatTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedDate = DateFormat('HH:mm:ss').format(dateTime);
  return formattedDate;
}

DateTime formatTimeDateTime(String dateTimeString) {
  return DateTime.parse(dateTimeString);
}

String getCurrentTime() {
  DateTime now = DateTime.now();
  String formattedTime = DateFormat('HH:mm:ss').format(now);

  return formattedTime;
}
String formatTimeOfDay(TimeOfDay timeOfDay) {
  final hour = timeOfDay.hour;
  final minute = timeOfDay.minute;
  final period = hour >= 12 ? 'PM' : 'AM';
  final formattedHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
  final formattedMinute = minute.toString().padLeft(2, '0');
  
  return '$formattedHour:$formattedMinute $period';
}