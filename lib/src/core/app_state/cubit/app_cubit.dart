import 'package:baliqchi/src/core/app_state/localization.dart';
import 'package:baliqchi/src/core/services/services.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(AppState(
          locale: Localization.uz,
          isDark: false,
          lang: 'uz',
        ));

  changeLocale(Locale locale, String lang) {
    emit(state.copyWith(
      locale: locale,
      lang: lang,
    ));
    Prefs.setString(AppConstants.kLanguage, lang);
  }

  init() async {
    var isDark = await Prefs.getBool(AppConstants.kDark) ?? false;
    var lang = await Prefs.getString(AppConstants.kLanguage) ?? 'uz';
    var localization = Localization.all.firstWhere((element) => element.languageCode == lang);
    emit(state.copyWith(locale: localization, isDark: isDark, lang: lang));
  }
}
