import 'package:flutter/cupertino.dart';

import 'tg_locale.dart';
import 'tg_localization.dart';

///Extended implementation of LocalizationsDelegate which Flutter uses internally
class TGLocalizationsDelegate extends LocalizationsDelegate<TGLocalization> {
  const TGLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return TGLocale.supportedLocales.any((element) =>
        element.languageCode == locale.languageCode &&
        element.countryCode == locale.countryCode);
  }

  @override
  Future<TGLocalization> load(Locale locale) async {
    TGLocalization localization = new TGLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<TGLocalization> old) => false;
}
