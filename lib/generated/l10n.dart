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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
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
    return Intl.message('Yoki', name: 'yoki', desc: '', args: []);
  }

  /// `Davom etish`
  String get davomEtish {
    return Intl.message('Davom etish', name: 'davomEtish', desc: '', args: []);
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
    return Intl.message('Parol', name: 'parol', desc: '', args: []);
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
    return Intl.message('Kirish', name: 'kirish', desc: '', args: []);
  }

  /// `Ismi`
  String get ismi {
    return Intl.message('Ismi', name: 'ismi', desc: '', args: []);
  }

  /// `Familiya`
  String get familiya {
    return Intl.message('Familiya', name: 'familiya', desc: '', args: []);
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
    return Intl.message('Mavsum:', name: 'mavsum', desc: '', args: []);
  }

  /// `Kirsh:`
  String get kirsh {
    return Intl.message('Kirsh:', name: 'kirsh', desc: '', args: []);
  }

  /// `Manzil:`
  String get manzil {
    return Intl.message('Manzil:', name: 'manzil', desc: '', args: []);
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
    return Intl.message('Qidirish...', name: 'qidirish', desc: '', args: []);
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
    return Intl.message('Baliq turi', name: 'baliqTuri', desc: '', args: []);
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
    return Intl.message('Baliq soni', name: 'baliqSoni', desc: '', args: []);
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
    return Intl.message('Ovqat turi', name: 'ovqatTuri', desc: '', args: []);
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
    return Intl.message('Soni', name: 'soni', desc: '', args: []);
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
    return Intl.message('Daromad', name: 'daromad', desc: '', args: []);
  }

  /// `Foyda`
  String get foyda {
    return Intl.message('Foyda', name: 'foyda', desc: '', args: []);
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
    return Intl.message('Baliq narxi', name: 'baliqNarxi', desc: '', args: []);
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
    return Intl.message('Ta\'riflar', name: 'tariflar', desc: '', args: []);
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
    return Intl.message('Oy', name: 'oy', desc: '', args: []);
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
    return Intl.message('Qo’shish', name: 'qoshish', desc: '', args: []);
  }

  /// `Hisoblash`
  String get hisoblash {
    return Intl.message('Hisoblash', name: 'hisoblash', desc: '', args: []);
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
    return Intl.message('Tarif turi', name: 'tarifTuri', desc: '', args: []);
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

  /// `Omillari`
  String get omillari {
    return Intl.message('Omillari', name: 'omillari', desc: '', args: []);
  }

  /// `Sindromlari`
  String get sindromlari {
    return Intl.message('Sindromlari', name: 'sindromlari', desc: '', args: []);
  }

  /// `Davolash usuli`
  String get davolashUsuli {
    return Intl.message(
      'Davolash usuli',
      name: 'davolashUsuli',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Qabul qilish`
  String get qabulQilish {
    return Intl.message(
      'Qabul qilish',
      name: 'qabulQilish',
      desc: '',
      args: [],
    );
  }

  /// `Dan`
  String get dan {
    return Intl.message('Dan', name: 'dan', desc: '', args: []);
  }

  /// `Gacha`
  String get gacha {
    return Intl.message('Gacha', name: 'gacha', desc: '', args: []);
  }

  /// `Havza ma’lumotlarini kiritish`
  String get havzaMalumotlariniKiritish {
    return Intl.message(
      'Havza ma’lumotlarini kiritish',
      name: 'havzaMalumotlariniKiritish',
      desc: '',
      args: [],
    );
  }

  /// `Havza nomi`
  String get havzaNomi {
    return Intl.message('Havza nomi', name: 'havzaNomi', desc: '', args: []);
  }

  /// `Saqlash`
  String get saqlash {
    return Intl.message('Saqlash', name: 'saqlash', desc: '', args: []);
  }

  /// `Umumiy ma’lumotlar`
  String get umumiyMalumotlar {
    return Intl.message(
      'Umumiy ma’lumotlar',
      name: 'umumiyMalumotlar',
      desc: '',
      args: [],
    );
  }

  /// `Ozuqa haqida ma'lumotlar`
  String get ozuqaHaqidaMalumotlar {
    return Intl.message(
      'Ozuqa haqida ma\'lumotlar',
      name: 'ozuqaHaqidaMalumotlar',
      desc: '',
      args: [],
    );
  }

  /// `Suv hajmi, m³`
  String get suvHajmiM {
    return Intl.message('Suv hajmi, m³', name: 'suvHajmiM', desc: '', args: []);
  }

  /// `Baliqlarning zichligi, kg/m3`
  String get baliqlarningZichligiKgm3 {
    return Intl.message(
      'Baliqlarning zichligi, kg/m3',
      name: 'baliqlarningZichligiKgm3',
      desc: '',
      args: [],
    );
  }

  /// `Yashab qoladigan baliqlar soni`
  String get yashabQoladiganBaliqlarSoni {
    return Intl.message(
      'Yashab qoladigan baliqlar soni',
      name: 'yashabQoladiganBaliqlarSoni',
      desc: '',
      args: [],
    );
  }

  /// `Umumiy ozuqani hisoblash`
  String get umumiyOzuqaniHisoblash {
    return Intl.message(
      'Umumiy ozuqani hisoblash',
      name: 'umumiyOzuqaniHisoblash',
      desc: '',
      args: [],
    );
  }

  /// `Ozuqa turi`
  String get ozuqaTuri {
    return Intl.message('Ozuqa turi', name: 'ozuqaTuri', desc: '', args: []);
  }

  /// `Ozuqa narxi, so’m`
  String get ozuqaNarxiSom {
    return Intl.message(
      'Ozuqa narxi, so’m',
      name: 'ozuqaNarxiSom',
      desc: '',
      args: [],
    );
  }

  /// `Baliq vaznining o‘sish oralig‘i`
  String get baliqVazniningOsishOraligi {
    return Intl.message(
      'Baliq vaznining o‘sish oralig‘i',
      name: 'baliqVazniningOsishOraligi',
      desc: '',
      args: [],
    );
  }

  /// `O‘sish muddati`
  String get osishMuddati {
    return Intl.message(
      'O‘sish muddati',
      name: 'osishMuddati',
      desc: '',
      args: [],
    );
  }

  /// `Talab qilingan ozuqa, kg`
  String get talabQilinganOvqatKg {
    return Intl.message(
      'Talab qilingan ozuqa, kg',
      name: 'talabQilinganOvqatKg',
      desc: '',
      args: [],
    );
  }

  /// `Tavsiya etilgan suv harorati (°C)`
  String get tavsiyaEtilganSuvHaroratiC {
    return Intl.message(
      'Tavsiya etilgan suv harorati (°C)',
      name: 'tavsiyaEtilganSuvHaroratiC',
      desc: '',
      args: [],
    );
  }

  /// `Ozuqalanish darajasi (kg/100kg baliq/kun)`
  String get ozuqalanishDarajasiKg100kgBaliqkun {
    return Intl.message(
      'Ozuqalanish darajasi (kg/100kg baliq/kun)',
      name: 'ozuqalanishDarajasiKg100kgBaliqkun',
      desc: '',
      args: [],
    );
  }

  /// `Taxminiy o'sishi (%/kun)`
  String get taxminiyOsishiKun {
    return Intl.message(
      'Taxminiy o\'sishi (%/kun)',
      name: 'taxminiyOsishiKun',
      desc: '',
      args: [],
    );
  }

  /// `Taxmin qilingan kunlar`
  String get taxminQilinganKunlar {
    return Intl.message(
      'Taxmin qilingan kunlar',
      name: 'taxminQilinganKunlar',
      desc: '',
      args: [],
    );
  }

  /// `Talab qilingan ozuqa/kun, kg`
  String get talabQilinganOzuqakunKg {
    return Intl.message(
      'Talab qilingan ozuqa/kun, kg',
      name: 'talabQilinganOzuqakunKg',
      desc: '',
      args: [],
    );
  }

  /// `Tanlash`
  String get tanlash {
    return Intl.message('Tanlash', name: 'tanlash', desc: '', args: []);
  }

  /// `Karta raqami`
  String get kartaRaqami {
    return Intl.message(
      'Karta raqami',
      name: 'kartaRaqami',
      desc: '',
      args: [],
    );
  }

  /// `Shaxsiy karta ma'lumotlari`
  String get shaxsiyKartaMalumotlari {
    return Intl.message(
      'Shaxsiy karta ma`lumotlari',
      name: 'shaxsiyKartaMalumotlari',
      desc: '',
      args: [],
    );
  }

  /// `Muddati`
  String get muddati {
    return Intl.message('Muddati', name: 'muddati', desc: '', args: []);
  }

  /// `Chiqish`
  String get chiqish {
    return Intl.message('Chiqish', name: 'chiqish', desc: '', args: []);
  }

  /// `Boqilayotgan baliqlar`
  String get boqilayotganBaliqlar {
    return Intl.message(
      'Boqilayotgan baliqlar',
      name: 'boqilayotganBaliqlar',
      desc: '',
      args: [],
    );
  }

  /// `Kasallik turlari`
  String get kasallikTurlari {
    return Intl.message(
      'Kasallik turlari',
      name: 'kasallikTurlari',
      desc: '',
      args: [],
    );
  }

  /// `Iqtisodiy ko’rsatkichlar`
  String get iqtisodiyKorsatkichlar {
    return Intl.message(
      'Iqtisodiy ko’rsatkichlar',
      name: 'iqtisodiyKorsatkichlar',
      desc: '',
      args: [],
    );
  }

  /// `Boshlang'ich og'irligi, g`
  String get boshlangichOgirligiKg {
    return Intl.message(
      'Boshlang\'ich og\'irligi, g',
      name: 'boshlangichOgirligiKg',
      desc: '',
      args: [],
    );
  }

  /// `Yakuniy og'irligi, g`
  String get yakuniyOgirligiKg {
    return Intl.message(
      'Yakuniy og\'irligi, g',
      name: 'yakuniyOgirligiKg',
      desc: '',
      args: [],
    );
  }

  /// `Batafsil`
  String get batafsil {
    return Intl.message('Batafsil', name: 'batafsil', desc: '', args: []);
  }

  /// `Hisobni o'chirish`
  String get deleteAccount {
    return Intl.message(
      'Hisobni o\'chirish',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Foydalanuvchini tizimdan oʼchirish`
  String get hisobniOchirish {
    return Intl.message(
      'Foydalanuvchini tizimdan oʼchirish',
      name: 'hisobniOchirish',
      desc: '',
      args: [],
    );
  }

  /// `Foydalanuvchi tizimdan oʼchirilgandan soʼng, uning shaxsiy maʼlumotlari va murojaatlar bilan bogʼliq barcha  maʼlumotlar tizimidan oʼchiriladi. Aloqa nazorati mobilь ilovasi qayta yuklangandan soʼng  foydalanuvchining avvalgi shaxsiy ma'lumotlari va murojaatlar bilan bog'liq ma'lumotlar qayta tiklanmaydi.`
  String
  get foydalanuvchiTizimdanOchirilgandanSongUningShaxsiyMalumotlariVaMurojaatlarBilan {
    return Intl.message(
      'Foydalanuvchi tizimdan oʼchirilgandan soʼng, uning shaxsiy maʼlumotlari va murojaatlar bilan bogʼliq barcha  maʼlumotlar tizimidan oʼchiriladi. Aloqa nazorati mobilь ilovasi qayta yuklangandan soʼng  foydalanuvchining avvalgi shaxsiy ma\'lumotlari va murojaatlar bilan bog\'liq ma\'lumotlar qayta tiklanmaydi.',
      name:
          'foydalanuvchiTizimdanOchirilgandanSongUningShaxsiyMalumotlariVaMurojaatlarBilan',
      desc: '',
      args: [],
    );
  }

  /// `Mobilь telefon bilan bogʼliq sabablar (telefonning yoʼqolishi, boshqa odamga berib yuborish, raqamning oʼzgarishi va b.);`
  String
  get mobilTelefonBilanBogliqSabablarTelefonningYoqolishiBoshqaOdamgaBerib {
    return Intl.message(
      'Mobilь telefon bilan bogʼliq sabablar (telefonning yoʼqolishi, boshqa odamga berib yuborish, raqamning oʼzgarishi va b.);',
      name:
          'mobilTelefonBilanBogliqSabablarTelefonningYoqolishiBoshqaOdamgaBerib',
      desc: '',
      args: [],
    );
  }

  /// `Ilova bilan bogʼliq sabablar (ilovaning koʼrishi tushunarsiz, ilovadan foydalanish qiyin va b.);`
  String
  get ilovaBilanBogliqSabablarIlovaningKorishiTushunarsizIlovadanFoydalanishQiyin {
    return Intl.message(
      'Ilova bilan bogʼliq sabablar (ilovaning koʼrishi tushunarsiz, ilovadan foydalanish qiyin va b.);',
      name:
          'ilovaBilanBogliqSabablarIlovaningKorishiTushunarsizIlovadanFoydalanishQiyin',
      desc: '',
      args: [],
    );
  }

  /// `Boshqa masalalar.`
  String get boshqaMasalalar {
    return Intl.message(
      'Boshqa masalalar.',
      name: 'boshqaMasalalar',
      desc: '',
      args: [],
    );
  }

  /// `Qo'shimcha izoh qoldirish`
  String get qoshimchaIzohQoldirish {
    return Intl.message(
      'Qo\'shimcha izoh qoldirish',
      name: 'qoshimchaIzohQoldirish',
      desc: '',
      args: [],
    );
  }

  /// `Foydalanuvchini tizimdan oʼchirish foydalanuvchining qaroriga qarab amalga oshiriladi. Hurmatli foydalanuvchi, Aloqa nazorati mobil ilovasini oʼchirishdan avval oʼchirish sabablarini koʼrsating:`
  String
  get foydalanuvchiniTizimdanOchirishFoydalanuvchiningQarorigaQarabAmalgaOshiriladiHurmatliFoydalanuvchi {
    return Intl.message(
      'Foydalanuvchini tizimdan oʼchirish foydalanuvchining qaroriga qarab amalga oshiriladi. Hurmatli foydalanuvchi, Aloqa nazorati mobil ilovasini oʼchirishdan avval oʼchirish sabablarini koʼrsating:',
      name:
          'foydalanuvchiniTizimdanOchirishFoydalanuvchiningQarorigaQarabAmalgaOshiriladiHurmatliFoydalanuvchi',
      desc: '',
      args: [],
    );
  }

  /// `Посмотреть на карте`
  String get seeMap {
    return Intl.message(
      'Посмотреть на карте',
      name: 'seeMap',
      desc: '',
      args: [],
    );
  }

  /// `Havzalar`
  String get havzalar {
    return Intl.message('Havzalar', name: 'havzalar', desc: '', args: []);
  }

  /// `Sana`
  String get sana {
    return Intl.message('Sana', name: 'sana', desc: '', args: []);
  }

  /// `Sotilgan`
  String get sotilgan {
    return Intl.message('Sotilgan', name: 'sotilgan', desc: '', args: []);
  }

  /// `O'lgan`
  String get olgan {
    return Intl.message('O\'lgan', name: 'olgan', desc: '', args: []);
  }

  /// `Izoh`
  String get izoh {
    return Intl.message('Izoh', name: 'izoh', desc: '', args: []);
  }

  /// `Baliqlarning kamayishi`
  String get baliqlarningKamayishi {
    return Intl.message(
      'Baliqlarning kamayishi',
      name: 'baliqlarningKamayishi',
      desc: '',
      args: [],
    );
  }

  /// `Kamayish turi`
  String get kamayishTuri {
    return Intl.message(
      'Kamayish turi',
      name: 'kamayishTuri',
      desc: '',
      args: [],
    );
  }

  /// `Baliqlarning kamayishini kiritish`
  String get baliqlarningKamayishiniKiritish {
    return Intl.message(
      'Baliqlarning kamayishini kiritish',
      name: 'baliqlarningKamayishiniKiritish',
      desc: '',
      args: [],
    );
  }

  /// `Yilni tanlang`
  String get yilniTanlang {
    return Intl.message(
      'Yilni tanlang',
      name: 'yilniTanlang',
      desc: '',
      args: [],
    );
  }

  /// `Yopish`
  String get yopish {
    return Intl.message('Yopish', name: 'yopish', desc: '', args: []);
  }

  /// `FCR ko'rsatkishi`
  String get fcrKorsatkishi {
    return Intl.message(
      'FCR ko\'rsatkishi',
      name: 'fcrKorsatkishi',
      desc: '',
      args: [],
    );
  }

  /// `Havza tarixi`
  String get havzaTarixi {
    return Intl.message(
      'Havza tarixi',
      name: 'havzaTarixi',
      desc: '',
      args: [],
    );
  }

  /// `Oldingmi baliqlar soni`
  String get oldingmiBaliqlarSoni {
    return Intl.message(
      'Oldingmi baliqlar soni',
      name: 'oldingmiBaliqlarSoni',
      desc: '',
      args: [],
    );
  }

  /// `Hozirgi baliqlar soni`
  String get hozirgiBaliqlarSoni {
    return Intl.message(
      'Hozirgi baliqlar soni',
      name: 'hozirgiBaliqlarSoni',
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
