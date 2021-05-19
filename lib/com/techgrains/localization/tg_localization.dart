import 'package:flutter/cupertino.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/util/tg_file_util.dart';

import 'tg_locale.dart';

/// Localization for each locale loads values from json file.
class TGLocalization {
  final Locale? locale;
  static const LOCALE_PATH = "assets/locale/";
  Map<String, dynamic>? _entries;

  TGLocalization(this.locale);

  /// Load Json File name based on Language Code and Country Code.
  /// Example: "{languageCode}_{countryCode}.json" > "en_us.json"
  Future<bool> load() async {
    String fileName = _deriveFileName();
    TGLog.d("TGLocalization.load : " + fileName);
    _entries = await TGFileUtil.readJsonFileAsMap(LOCALE_PATH + fileName);
    TGLocale.localizations[locale.toString()] = this;
    return true;
  }

  String _deriveFileName() {
    return TGLocale.generateCode(locale!) + ".json";
  }

  /// Text related to localised key. In case of entry won't found, will return back key as text.
  String text(String key) {
    dynamic value = _entries![key];
    return (value != null && value.toString().length > 0) ? value : key;
  }
}
