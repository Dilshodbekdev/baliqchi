// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Akkauntingiz yo'qmi?`
  String get akkauntingizYoqmi {
    return Intl.message(
      'Akkauntingiz yo\'qmi?',
      name: 'akkauntingizYoqmi',
      desc: '',
      args: [],
    );
  }

  /// `Yoki`
  String get yoki {
    return Intl.message(
      'Yoki',
      name: 'yoki',
      desc: '',
      args: [],
    );
  }

  /// `Davom etish`
  String get davomEtish {
    return Intl.message(
      'Davom etish',
      name: 'davomEtish',
      desc: '',
      args: [],
    );
  }

  /// `Roʻyxatdan oʻtish`
  String get royxatdanOtish {
    return Intl.message(
      'Roʻyxatdan oʻtish',
      name: 'royxatdanOtish',
      desc: '',
      args: [],
    );
  }

  /// `Parolingizni unutdingizmi?`
  String get parolingizniUnutdingizmi {
    return Intl.message(
      'Parolingizni unutdingizmi?',
      name: 'parolingizniUnutdingizmi',
      desc: '',
      args: [],
    );
  }

  /// `Parol`
  String get parol {
    return Intl.message(
      'Parol',
      name: 'parol',
      desc: '',
      args: [],
    );
  }

  /// `Telefon raqam`
  String get telefonRaqam {
    return Intl.message(
      'Telefon raqam',
      name: 'telefonRaqam',
      desc: '',
      args: [],
    );
  }

  /// `Tizimga kirish`
  String get tizimgaKirish {
    return Intl.message(
      'Tizimga kirish',
      name: 'tizimgaKirish',
      desc: '',
      args: [],
    );
  }

  /// `Tilni tanlang`
  String get tilniTanlang {
    return Intl.message(
      'Tilni tanlang',
      name: 'tilniTanlang',
      desc: '',
      args: [],
    );
  }

  /// `Tasdiqlash kodi`
  String get tasdiqlashKodi {
    return Intl.message(
      'Tasdiqlash kodi',
      name: 'tasdiqlashKodi',
      desc: '',
      args: [],
    );
  }

  /// `Telefon raqamingizga yuborilgan tasdiqlash kodini kiriting`
  String get telefonRaqamingizgaYuborilganTasdiqlashKodiniKiriting {
    return Intl.message(
      'Telefon raqamingizga yuborilgan tasdiqlash kodini kiriting',
      name: 'telefonRaqamingizgaYuborilganTasdiqlashKodiniKiriting',
      desc: '',
      args: [],
    );
  }

  /// `Kirish`
  String get kirish {
    return Intl.message(
      'Kirish',
      name: 'kirish',
      desc: '',
      args: [],
    );
  }

  /// `Ismi`
  String get ismi {
    return Intl.message(
      'Ismi',
      name: 'ismi',
      desc: '',
      args: [],
    );
  }

  /// `Familiya`
  String get familiya {
    return Intl.message(
      'Familiya',
      name: 'familiya',
      desc: '',
      args: [],
    );
  }

  /// `Parolni tasdiqlang`
  String get parolniTasdiqlang {
    return Intl.message(
      'Parolni tasdiqlang',
      name: 'parolniTasdiqlang',
      desc: '',
      args: [],
    );
  }

  /// `Viloyatni Tanlang`
  String get viloyatniTanlang {
    return Intl.message(
      'Viloyatni Tanlang',
      name: 'viloyatniTanlang',
      desc: '',
      args: [],
    );
  }

  /// `Baliq ovi uchun maskanlar`
  String get baliqOviUchunMaskanlar {
    return Intl.message(
      'Baliq ovi uchun maskanlar',
      name: 'baliqOviUchunMaskanlar',
      desc: '',
      args: [],
    );
  }

  /// `Baliq boqish usullari`
  String get baliqBoqishUsullari {
    return Intl.message(
      'Baliq boqish usullari',
      name: 'baliqBoqishUsullari',
      desc: '',
      args: [],
    );
  }

  /// `Baliqchilar uchratgan baliqlar:`
  String get baliqchilarUchratganBaliqlar {
    return Intl.message(
      'Baliqchilar uchratgan baliqlar:',
      name: 'baliqchilarUchratganBaliqlar',
      desc: '',
      args: [],
    );
  }

  /// `Baliqchilar uchun muhim!`
  String get baliqchilarUchunMuhim {
    return Intl.message(
      'Baliqchilar uchun muhim!',
      name: 'baliqchilarUchunMuhim',
      desc: '',
      args: [],
    );
  }

  /// `Mavsum:`
  String get mavsum {
    return Intl.message(
      'Mavsum:',
      name: 'mavsum',
      desc: '',
      args: [],
    );
  }

  /// `Kirsh:`
  String get kirsh {
    return Intl.message(
      'Kirsh:',
      name: 'kirsh',
      desc: '',
      args: [],
    );
  }

  /// `Manzil:`
  String get manzil {
    return Intl.message(
      'Manzil:',
      name: 'manzil',
      desc: '',
      args: [],
    );
  }

  /// `Oxshash maskanlar`
  String get oxshashMaskanlar {
    return Intl.message(
      'Oxshash maskanlar',
      name: 'oxshashMaskanlar',
      desc: '',
      args: [],
    );
  }

  /// `Ma'lumot topilmadi`
  String get malumotTopilmadi {
    return Intl.message(
      'Ma\'lumot topilmadi',
      name: 'malumotTopilmadi',
      desc: '',
      args: [],
    );
  }

  /// `Qidirish...`
  String get qidirish {
    return Intl.message(
      'Qidirish...',
      name: 'qidirish',
      desc: '',
      args: [],
    );
  }

  /// `Tahminiy iqtisodiy ko’rsatkichlar`
  String get tahminiyIqtisodiyKorsatkichlar {
    return Intl.message(
      'Tahminiy iqtisodiy ko’rsatkichlar',
      name: 'tahminiyIqtisodiyKorsatkichlar',
      desc: '',
      args: [],
    );
  }

  /// `Baliq turi`
  String get baliqTuri {
    return Intl.message(
      'Baliq turi',
      name: 'baliqTuri',
      desc: '',
      args: [],
    );
  }

  /// `Havza gektari`
  String get havzaGektari {
    return Intl.message(
      'Havza gektari',
      name: 'havzaGektari',
      desc: '',
      args: [],
    );
  }

  /// `Havza uzunligi`
  String get havzaUzunligi {
    return Intl.message(
      'Havza uzunligi',
      name: 'havzaUzunligi',
      desc: '',
      args: [],
    );
  }

  /// `Havza kengligi`
  String get havzaKengligi {
    return Intl.message(
      'Havza kengligi',
      name: 'havzaKengligi',
      desc: '',
      args: [],
    );
  }

  /// `Havza chuqurligi`
  String get havzaChuqurligi {
    return Intl.message(
      'Havza chuqurligi',
      name: 'havzaChuqurligi',
      desc: '',
      args: [],
    );
  }

  /// `Baliq soni`
  String get baliqSoni {
    return Intl.message(
      'Baliq soni',
      name: 'baliqSoni',
      desc: '',
      args: [],
    );
  }

  /// `Mavsum boshidagi baliq og'irligi, g`
  String get mavsumBoshidagiBaliqOgirligiG {
    return Intl.message(
      'Mavsum boshidagi baliq og\'irligi, g',
      name: 'mavsumBoshidagiBaliqOgirligiG',
      desc: '',
      args: [],
    );
  }

  /// `Baliqning yashab qolish darajasi, %`
  String get baliqningYashabQolishDarajasi {
    return Intl.message(
      'Baliqning yashab qolish darajasi, %',
      name: 'baliqningYashabQolishDarajasi',
      desc: '',
      args: [],
    );
  }

  /// `Mavsum oxiridagi mo'ljallangan baliq og'irligi, g`
  String get mavsumOxiridagiMoljallanganBaliqOgirligiG {
    return Intl.message(
      'Mavsum oxiridagi mo\'ljallangan baliq og\'irligi, g',
      name: 'mavsumOxiridagiMoljallanganBaliqOgirligiG',
      desc: '',
      args: [],
    );
  }

  /// `Ovqat turi`
  String get ovqatTuri {
    return Intl.message(
      'Ovqat turi',
      name: 'ovqatTuri',
      desc: '',
      args: [],
    );
  }

  /// `Ovqat narxi 1kg, (so’m)`
  String get ovqatNarxi1kgSom {
    return Intl.message(
      'Ovqat narxi 1kg, (so’m)',
      name: 'ovqatNarxi1kgSom',
      desc: '',
      args: [],
    );
  }

  /// `Jami ishchilar oyligi(oy kesimida)`
  String get jamiIshchilarOyligioyKesimida {
    return Intl.message(
      'Jami ishchilar oyligi(oy kesimida)',
      name: 'jamiIshchilarOyligioyKesimida',
      desc: '',
      args: [],
    );
  }

  /// `kg baliqqa sarflanadigan ozuqa (kg)`
  String get kgBaliqqaSarflanadiganOzuqaKg {
    return Intl.message(
      'kg baliqqa sarflanadigan ozuqa (kg)',
      name: 'kgBaliqqaSarflanadiganOzuqaKg',
      desc: '',
      args: [],
    );
  }

  /// `Baliq yetishtirish muddati (oy)`
  String get baliqYetishtirishMuddatiOy {
    return Intl.message(
      'Baliq yetishtirish muddati (oy)',
      name: 'baliqYetishtirishMuddatiOy',
      desc: '',
      args: [],
    );
  }

  /// `Sotish rejalashtirilgan baliq narxi (so’m)`
  String get sotishRejalashtirilganBaliqNarxiSom {
    return Intl.message(
      'Sotish rejalashtirilgan baliq narxi (so’m)',
      name: 'sotishRejalashtirilganBaliqNarxiSom',
      desc: '',
      args: [],
    );
  }

  /// `Tashalayotgan baliqlar narxi (so’m)`
  String get tashalayotganBaliqlarNarxiSom {
    return Intl.message(
      'Tashalayotgan baliqlar narxi (so’m)',
      name: 'tashalayotganBaliqlarNarxiSom',
      desc: '',
      args: [],
    );
  }

  /// `Kamunal to’lovlar (oy kesimida)`
  String get kamunalTolovlarOyKesimida {
    return Intl.message(
      'Kamunal to’lovlar (oy kesimida)',
      name: 'kamunalTolovlarOyKesimida',
      desc: '',
      args: [],
    );
  }

  /// `Soliq harajatlari (oy kesimida)`
  String get soliqHarajatlariOyKesimida {
    return Intl.message(
      'Soliq harajatlari (oy kesimida)',
      name: 'soliqHarajatlariOyKesimida',
      desc: '',
      args: [],
    );
  }

  /// `Boshqa harajatlar (benzin, dori-darmon va boshqalar)  (so’m) (oy kesimida)`
  String get boshqaHarajatlarBenzinDoridarmonVaBoshqalarSomOyKesimida {
    return Intl.message(
      'Boshqa harajatlar (benzin, dori-darmon va boshqalar)  (so’m) (oy kesimida)',
      name: 'boshqaHarajatlarBenzinDoridarmonVaBoshqalarSomOyKesimida',
      desc: '',
      args: [],
    );
  }

  /// `Boqish usuli`
  String get boqishUsuli {
    return Intl.message(
      'Boqish usuli',
      name: 'boqishUsuli',
      desc: '',
      args: [],
    );
  }

  /// `Soni`
  String get soni {
    return Intl.message(
      'Soni',
      name: 'soni',
      desc: '',
      args: [],
    );
  }

  /// `Tashalayotgan baliqlar narxi`
  String get tashalayotganBaliqlarNarxi {
    return Intl.message(
      'Tashalayotgan baliqlar narxi',
      name: 'tashalayotganBaliqlarNarxi',
      desc: '',
      args: [],
    );
  }

  /// `Ozuqaga sarflangan harajat`
  String get ozuqagaSarflanganHarajat {
    return Intl.message(
      'Ozuqaga sarflangan harajat',
      name: 'ozuqagaSarflanganHarajat',
      desc: '',
      args: [],
    );
  }

  /// `Kamunal to’lo’vlar`
  String get kamunalTolovlar {
    return Intl.message(
      'Kamunal to’lo’vlar',
      name: 'kamunalTolovlar',
      desc: '',
      args: [],
    );
  }

  /// `Soliq harajatlari`
  String get soliqHarajatlari {
    return Intl.message(
      'Soliq harajatlari',
      name: 'soliqHarajatlari',
      desc: '',
      args: [],
    );
  }

  /// `Jami ishchilar oyligi`
  String get jamiIshchilarOyligi {
    return Intl.message(
      'Jami ishchilar oyligi',
      name: 'jamiIshchilarOyligi',
      desc: '',
      args: [],
    );
  }

  /// `Boshqa harajatlar`
  String get boshqaHarajatlar {
    return Intl.message(
      'Boshqa harajatlar',
      name: 'boshqaHarajatlar',
      desc: '',
      args: [],
    );
  }

  /// `Ummumiy harajatlar`
  String get ummumiyHarajatlar {
    return Intl.message(
      'Ummumiy harajatlar',
      name: 'ummumiyHarajatlar',
      desc: '',
      args: [],
    );
  }

  /// `Daromad`
  String get daromad {
    return Intl.message(
      'Daromad',
      name: 'daromad',
      desc: '',
      args: [],
    );
  }

  /// `Foyda`
  String get foyda {
    return Intl.message(
      'Foyda',
      name: 'foyda',
      desc: '',
      args: [],
    );
  }

  /// `1 kg baliqning tan narxi`
  String get KgBaliqningTanNarxi {
    return Intl.message(
      '1 kg baliqning tan narxi',
      name: 'KgBaliqningTanNarxi',
      desc: '',
      args: [],
    );
  }

  /// `Baliq narxi`
  String get baliqNarxi {
    return Intl.message(
      'Baliq narxi',
      name: 'baliqNarxi',
      desc: '',
      args: [],
    );
  }

  /// `Tilni o’zgartirish`
  String get tilniOzgartirish {
    return Intl.message(
      'Tilni o’zgartirish',
      name: 'tilniOzgartirish',
      desc: '',
      args: [],
    );
  }

  /// `To’lovlar tarixi`
  String get tolovlarTarixi {
    return Intl.message(
      'To’lovlar tarixi',
      name: 'tolovlarTarixi',
      desc: '',
      args: [],
    );
  }

  /// `Ta'riflar`
  String get tariflar {
    return Intl.message(
      'Ta\'riflar',
      name: 'tariflar',
      desc: '',
      args: [],
    );
  }

  /// `Oylik harajatlarni ko’rish`
  String get oylikHarajatlarniKorish {
    return Intl.message(
      'Oylik harajatlarni ko’rish',
      name: 'oylikHarajatlarniKorish',
      desc: '',
      args: [],
    );
  }

  /// `Oylik harajatlar`
  String get oylikHarajatlar {
    return Intl.message(
      'Oylik harajatlar',
      name: 'oylikHarajatlar',
      desc: '',
      args: [],
    );
  }

  /// `Oylik harajatlarni kiritish`
  String get oylikHarajatlarniKiritish {
    return Intl.message(
      'Oylik harajatlarni kiritish',
      name: 'oylikHarajatlarniKiritish',
      desc: '',
      args: [],
    );
  }

  /// `Statistikani ko'rish`
  String get statistikaniKorish {
    return Intl.message(
      'Statistikani ko\'rish',
      name: 'statistikaniKorish',
      desc: '',
      args: [],
    );
  }

  /// `Harajat turi`
  String get harajatTuri {
    return Intl.message(
      'Harajat turi',
      name: 'harajatTuri',
      desc: '',
      args: [],
    );
  }

  /// `Harajat nomi`
  String get harajatNomi {
    return Intl.message(
      'Harajat nomi',
      name: 'harajatNomi',
      desc: '',
      args: [],
    );
  }

  /// `Harajat miqdori`
  String get harajatMiqdori {
    return Intl.message(
      'Harajat miqdori',
      name: 'harajatMiqdori',
      desc: '',
      args: [],
    );
  }

  /// `Oy`
  String get oy {
    return Intl.message(
      'Oy',
      name: 'oy',
      desc: '',
      args: [],
    );
  }

  /// `Harajat miqdori, so’m`
  String get harajatMiqdoriSom {
    return Intl.message(
      'Harajat miqdori, so’m',
      name: 'harajatMiqdoriSom',
      desc: '',
      args: [],
    );
  }

  /// `Oyni tanlang`
  String get oyniTanlang {
    return Intl.message(
      'Oyni tanlang',
      name: 'oyniTanlang',
      desc: '',
      args: [],
    );
  }

  /// `Qo’shish`
  String get qoshish {
    return Intl.message(
      'Qo’shish',
      name: 'qoshish',
      desc: '',
      args: [],
    );
  }

  /// `Hisoblash`
  String get hisoblash {
    return Intl.message(
      'Hisoblash',
      name: 'hisoblash',
      desc: '',
      args: [],
    );
  }

  /// `Umumiy ma’lumotlarni kiritish`
  String get umumiyMalumotlarniKiritish {
    return Intl.message(
      'Umumiy ma’lumotlarni kiritish',
      name: 'umumiyMalumotlarniKiritish',
      desc: '',
      args: [],
    );
  }

  /// `Kunlik ovqat miqdorini ko’rish`
  String get kunlikOvqatMiqdoriniKorish {
    return Intl.message(
      'Kunlik ovqat miqdorini ko’rish',
      name: 'kunlikOvqatMiqdoriniKorish',
      desc: '',
      args: [],
    );
  }

  /// `Tarif turi`
  String get tarifTuri {
    return Intl.message(
      'Tarif turi',
      name: 'tarifTuri',
      desc: '',
      args: [],
    );
  }

  /// `To’lov summasi`
  String get tolovSummasi {
    return Intl.message(
      'To’lov summasi',
      name: 'tolovSummasi',
      desc: '',
      args: [],
    );
  }

  /// `Amal qilish muddati`
  String get amalQilishMuddati {
    return Intl.message(
      'Amal qilish muddati',
      name: 'amalQilishMuddati',
      desc: '',
      args: [],
    );
  }

  /// `Obuna bo‘lish`
  String get obunaBolish {
    return Intl.message(
      'Obuna bo‘lish',
      name: 'obunaBolish',
      desc: '',
      args: [],
    );
  }

  /// `Siz obuna bo‘lmagansiz!`
  String get sizObunaBolmagansiz {
    return Intl.message(
      'Siz obuna bo‘lmagansiz!',
      name: 'sizObunaBolmagansiz',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laboreUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo`
  String get loremIpsumDolorSitAmetConsecteturAdipiscingElitSedDo {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laboreUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo',
      name: 'loremIpsumDolorSitAmetConsecteturAdipiscingElitSedDo',
      desc: '',
      args: [],
    );
  }

  /// `Suv harorati (°C)`
  String get suvHaroratiC {
    return Intl.message(
      'Suv harorati (°C)',
      name: 'suvHaroratiC',
      desc: '',
      args: [],
    );
  }

  /// `Baliqlarning taxminiy soni`
  String get baliqlarningTaxminiySoni {
    return Intl.message(
      'Baliqlarning taxminiy soni',
      name: 'baliqlarningTaxminiySoni',
      desc: '',
      args: [],
    );
  }

  /// `Baliq og'irligi, g`
  String get baliqOgirligiG {
    return Intl.message(
      'Baliq og\'irligi, g',
      name: 'baliqOgirligiG',
      desc: '',
      args: [],
    );
  }

  /// `Kunlik ovqat miqdori, %`
  String get kunlikOvqatMiqdori {
    return Intl.message(
      'Kunlik ovqat miqdori, %',
      name: 'kunlikOvqatMiqdori',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
