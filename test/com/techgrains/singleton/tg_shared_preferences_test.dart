import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/listener/tg_shared_preferences_listener.dart';
import 'package:techgrains/com/techgrains/singleton/tg_shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  tearDown(() {});

  test('null', () async {
    await TGSharedPreferences.getInstance()!.set("keyNull", null);
    expect(await TGSharedPreferences.getInstance()!.get("keyNull"), null);

    expect(await TGSharedPreferences.getInstance()!.get("someKey"), null);
  });

  test('bool', () async {
    await TGSharedPreferences.getInstance()!.set("keyBool", true);
    expect(await TGSharedPreferences.getInstance()!.get("keyBool"), true);
  });

  test('int', () async {
    await TGSharedPreferences.getInstance()!.set("keyInt", 1);
    expect(await TGSharedPreferences.getInstance()!.get("keyInt"), 1);
  });

  test('double', () async {
    await TGSharedPreferences.getInstance()!.set("keyDouble", 2.0);
    expect(await TGSharedPreferences.getInstance()!.get("keyDouble"), 2.0);
  });

  test('string', () async {
    await TGSharedPreferences.getInstance()!.set("keyString", "String");
    expect(await TGSharedPreferences.getInstance()!.get("keyString"), "String");
  });

  test('stringList', () async {
    List<String> list = ["A", "B", "C", "D"];
    await TGSharedPreferences.getInstance()!.set("keyStringList", list);
    expect(await TGSharedPreferences.getInstance()!.get("keyStringList"), list);
  });

  test('listener', () async {
    TGSharedPreferences.getInstance()!
        .addListener(TGSharedPreferencesListenerForTest());

    await TGSharedPreferences.getInstance()!.set("keyString", "String");
    expect(await TGSharedPreferences.getInstance()!.get("keyString"), "String");
  });

  test('listener', () async {
    TGSharedPreferences.getInstance()!
        .addListener(TGSharedPreferencesListenerForTest());
    TGSharedPreferences.getInstance()!.set("key", "value");
    expect(TGSharedPreferences.getInstance()!.get("key"), "value");
    TGSharedPreferences.getInstance()!.remove("key");
    TGSharedPreferences.getInstance()!.removeAllListeners();
  });

  test('timestamp', () async {
    TGLog.d("createdAt = " +
        TGSharedPreferences.getInstance()!.createdAt().toString());
    TGLog.d("validSince = " +
        TGSharedPreferences.getInstance()!.validSince().toString());
    sleep(Duration(seconds: 1));
    TGLog.d("validSince = " +
        TGSharedPreferences.getInstance()!.validSince().toString());
  });
}

class TGSharedPreferencesListenerForTest extends TGSharedPreferencesListener {
  @override
  void keyRemove(String key) {
    TGLog.d("TGSharedPreferencesListenerForTest.keyRemove - " + key);
  }

  @override
  void keySet(String key) {
    TGLog.d("TGSharedPreferencesListenerForTest.keySet - " + key);
  }
}
