import 'dart:async';

import 'package:app/common/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/localization/tg_locale.dart';
import 'package:techgrains/com/techgrains/service/tg_service.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/singleton/tg_shared_preferences.dart';
import 'package:techgrains/com/techgrains/util/tg_flavor.dart';

import '../main.dart';

initTheme(BuildContext context) async {
  bool? flagDarkTheme =
      await TGSharedPreferences.getInstance().get(KEY_FLAG_DARK_THEME);
  if (flagDarkTheme == null) {
    flagDarkTheme = true;
    TGSharedPreferences.getInstance().set(KEY_FLAG_DARK_THEME, flagDarkTheme);
  }
  TGSession.getInstance().set(KEY_FLAG_DARK_THEME, flagDarkTheme);

  String? textSize = await TGSharedPreferences.getInstance().get(KEY_TEXT_SIZE);
  if (textSize == null) {
    textSize = "R";
    TGSharedPreferences.getInstance().set(KEY_TEXT_SIZE, textSize);
  }
  TGSession.getInstance().set(KEY_TEXT_SIZE, textSize);

  TechgrainsExampleApp.buildTheme(context, flagDarkTheme, textSize);
}

Future<void> initUser() async {
  TGLog.d("initUser()");
  String? userAsJson =
      await TGSharedPreferences.getInstance().get(KEY_OBJ_USER);
  userAsJson != null
      ? TGSession.getInstance().set(KEY_OBJ_USER, null) // Set User Object
      : TGSession.getInstance().remove(KEY_OBJ_USER);
}

Future<void> initProfile() async {
  TGLog.d("initProfile()");
  String? profileAsJson =
      await TGSharedPreferences.getInstance().get(KEY_OBJ_PROFILE);
  profileAsJson != null
      ? TGSession.getInstance().set(KEY_OBJ_PROFILE, null) // Set Profile Object
      : TGSession.getInstance().remove(KEY_OBJ_PROFILE);
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
      await TGSharedPreferences.getInstance().get(KEY_APP_LOCALE_CODE);
  if (storedLocaleCode != null) {
    Locale? locale = TGLocale.findLocaleByCode(storedLocaleCode);
    TechgrainsExampleApp.setLocale(locale);
  }
}

Future<void> initAppVersionInfo() async {
  TGLog.d("initAppVersionInfo()");
  TGSession.getInstance().set(KEY_APP_VERSION, "v1.0");
}
