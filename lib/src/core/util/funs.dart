import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String convertDateTime(String? date) {
  var outputDate = "";
  if (date != null) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm');
    outputDate = outputFormat.format(inputDate);
  }
  return outputDate;
}

