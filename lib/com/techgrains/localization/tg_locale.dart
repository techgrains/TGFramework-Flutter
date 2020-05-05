import 'package:flutter/cupertino.dart';

import 'tg_localization.dart';

/// Supported, default and current locale holders with locale related supporting features
class TGLocale {
  static Iterable<Locale> supportedLocales;
  static Locale defaultLocale;
  static Locale currentLocale;

  /// Callback for locale resolution
  static Locale localeResolutionCallback(
      Locale locale, Iterable<Locale> supportedLocales) {
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
      {@required Locale defaultLocale, List<Locale> otherLocales}) {
    List<Locale> supportedLocales = [];
    supportedLocales.add(defaultLocale);
    if (otherLocales != null && otherLocales.length > 0)
      supportedLocales.addAll(otherLocales);
    TGLocale.supportedLocales = supportedLocales;
    TGLocale.defaultLocale = defaultLocale;
    TGLocale.currentLocale = defaultLocale;
  }

  /// Text value of provided key
  static String text(final BuildContext context, final String key) {
    return TGLocalization.of(context).text(key);
  }

  /// Generate code for provided locale
  static String generateCode(Locale locale) {
    return locale.languageCode +
        ((locale.countryCode != null && locale.countryCode.length > 0)
            ? "_" + locale.countryCode
            : "");
  }

  /// Find locale from supported list based on provided code. i.e. Locale ("en", "US") = "en_US"
  static Locale findLocaleByCode(String code) {
    return supportedLocales.firstWhere((locale) => code == generateCode(locale),
        orElse: () => defaultLocale);
  }
}
