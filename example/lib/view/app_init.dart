import 'dart:async';

import 'package:app/common/keys.dart';
import 'package:app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/localization/tg_locale.dart';
import 'package:techgrains/com/techgrains/service/tg_service.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/singleton/tg_shared_preferences.dart';
import 'package:techgrains/com/techgrains/util/tg_flavor.dart';

initTheme(BuildContext context) async {
  bool? flagDarkTheme =
      await TGSharedPreferences.getInstance().get(keyFlagDarkTheme);
  if (flagDarkTheme == null) {
    flagDarkTheme = true;
    TGSharedPreferences.getInstance().set(keyFlagDarkTheme, flagDarkTheme);
  }
  TGSession.getInstance().set(keyFlagDarkTheme, flagDarkTheme);

  String? textSize = await TGSharedPreferences.getInstance().get(keyTextSize);
  if (textSize == null) {
    textSize = "R";
    TGSharedPreferences.getInstance().set(keyTextSize, textSize);
  }
  TGSession.getInstance().set(keyTextSize, textSize);

  TechgrainsExampleApp.buildTheme(flagDarkTheme, textSize);
}

Future<void> initUser() async {
  TGLog.d("initUser()");
  String? userAsJson = await TGSharedPreferences.getInstance().get(keyObjUser);
  userAsJson != null
      ? TGSession.getInstance().set(keyObjUser, null) // Set User Object
      : TGSession.getInstance().remove(keyObjUser);
}

Future<void> initProfile() async {
  TGLog.d("initProfile()");
  String? profileAsJson =
      await TGSharedPreferences.getInstance().get(keyObjProfile);
  profileAsJson != null
      ? TGSession.getInstance().set(keyObjProfile, null) // Set Profile Object
      : TGSession.getInstance().remove(keyObjProfile);
}

Future<void> initService() async {
  TGLog.d("initService()");
  await TGService.init(
      baseUrl: TGFlavor.baseUrl(),
      applyMock: TGFlavor.applyMock(),
      mockMappingsFile: TGFlavor.mockMappingsFile(),
      headers: defaultHeaders(),
      badCertificateCallbackEnabled: false);
}

Map<String, String> defaultHeaders() {
  Map<String, String> headers = {};
  headers['Content-Type'] = 'application/json';
  headers['locale'] = TGLocale.currentLocale.toString();
  return headers;
}

Future<void> initLocale() async {
  TGLog.d("initLocale()");
  String? storedLocaleCode =
      await TGSharedPreferences.getInstance().get(keyAppLocaleCode);
  if (storedLocaleCode != null) {
    Locale? locale = TGLocale.findLocaleByCode(storedLocaleCode);
    TechgrainsExampleApp.setLocale(locale);
  }
}

Future<void> initAppVersionInfo() async {
  TGLog.d("initAppVersionInfo()");
  TGSession.getInstance().set(keyAppVersion, "v1.0");
}
