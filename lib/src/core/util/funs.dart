import 'dart:io';

import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

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

String getCurrencySymbol(double value) {
  String valueString = value.toStringAsFixed(0);
  String pattern = r'(\d)(?=(\d{3})+(?!\d))';
  RegExp regex = RegExp(pattern);
  String formattedValue = valueString.replaceAllMapped(regex, (Match match) => '${match.group(1)} ');
  return '$formattedValue so\'m';
}

Future<String> fetchImageUrl(String url) async {
  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String appDocPath = appDocDir.path;
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60 * 1000),
      receiveTimeout: const Duration(seconds: 60 * 1000),
      listFormat: ListFormat.multiCompatible,
    ),
  );
  dio.interceptors.add(CookieManager(PersistCookieJar(
    ignoreExpires: true,
    storage: FileStorage("$appDocPath/.cookies/"),
  )));

  final response = await dio.get(url);

  if (response.statusCode == 200) {
    // Parse the response to get the image URL
    final imageUrl = response.data['imageUrl']; // Adjust this according to your API response
    return imageUrl;
  } else {
    throw Exception('Failed to load image');
  }
}
