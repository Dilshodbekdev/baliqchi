part of 'app_cubit.dart';

class AppState {
  final Locale locale;
  final bool isDark;
  final String lang;

  AppState({
    required this.locale,
    required this.isDark,
    required this.lang,
  });

  AppState copyWith({
    Locale? locale,
    bool? isDark,
    String? lang,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      isDark: isDark ?? this.isDark,
      lang: lang ?? this.lang,
    );
  }
}
