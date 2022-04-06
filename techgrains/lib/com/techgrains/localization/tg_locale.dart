import 'package:flutter/cupertino.dart';
import 'package:techgrains/com/techgrains/localization/tg_localizations_delegate.dart';

import 'tg_localization.dart';

/// Supported, default and current locale holders with locale related supporting features
class TGLocale {
  static late Iterable<Locale> supportedLocales = [];
  static Locale defaultLocale = const Locale("en", "US");
  static Locale currentLocale = defaultLocale;
  static Map<String, TGLocalization> localizations = {};
  static String customPath = "";

  /// Callback for locale resolution
  static Locale? localeResolutionCallback(
      Locale? locale, Iterable<Locale> supportedLocales) {
    if (locale != null)
      for (var supportedLocale in supportedLocales)
        if (supportedLocale.languageCode == locale.languageCode) {
          if (locale.countryCode == null)
            return supportedLocale;
          else if (supportedLocale.countryCode == locale.countryCode)
            return supportedLocale;
        }
    return defaultLocale;
  }

  /// Initialize Localization (i18n) implementation
  static void init(
      {required Locale defaultLocale,
      List<Locale>? otherLocales,
      String customPath = ""}) {
    List<Locale> supportedLocales = [];
    supportedLocales.add(defaultLocale);
    if (otherLocales != null && otherLocales.length > 0)
      supportedLocales.addAll(otherLocales);
    TGLocale.supportedLocales = supportedLocales;
    TGLocale.defaultLocale = defaultLocale;
    TGLocale.currentLocale = defaultLocale;
    TGLocale.customPath = customPath;
    loadLocales();
  }

  static void loadLocales() {
    supportedLocales.forEach((locale) {
      TGLocalizationsDelegate().load(locale);
    });
  }

  /// Text value of provided key with optional args which replaces each {index}
  static String text(final String key, {List<String>? args}) {
    TGLocalization? currentLocalization =
        localizations[currentLocale.toString()];
    if (currentLocalization == null) return key;
    String value = currentLocalization.text(key);
    if (args == null || args.length == 0) return value;
    return _replaceArgs(value, args);
  }

  /// Replaces args in the translated value
  static String _replaceArgs(String value, List<String> args) {
    args.forEach((arg) {
      value = value.replaceAll("{" + args.indexOf(arg).toString() + "}", arg);
    });
    return value;
  }

  /// Generate code for provided locale
  static String generateCode(Locale locale) {
    return locale.languageCode +
        ((locale.countryCode != null && locale.countryCode!.length > 0)
            ? "_" + locale.countryCode!
            : "");
  }

  /// Find locale from supported list based on provided code. i.e. Locale ("en", "US") = "en_US"
  static Locale findLocaleByCode(String code) {
    for (Locale locale in supportedLocales)
      if (code == generateCode(locale)) return locale;
    return defaultLocale;
  }
}
