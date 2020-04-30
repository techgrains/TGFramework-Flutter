import 'package:shared_preferences/shared_preferences.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';

class TGSharedPreferences {
  static TGSharedPreferences _instance;

  static TGSharedPreferences getInstance() {
    if (_instance == null) {
      _instance = new TGSharedPreferences._();
    }
    return _instance;
  }

  TGSharedPreferences._() {
    TGLog.d("TGSharedPreferences : Initiated");
  }

  Future<SharedPreferences> getSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  Future<bool> _save<T>(String key, T content) async {
    SharedPreferences prefs = await getSharedPreferences();
    TGLog.d('TGSharedPreferences.set - key:[$key], value:[$content]');

    if (content is String) {
      return prefs.setString(key, content);
    }
    if (content is bool) {
      return prefs.setBool(key, content);
    }
    if (content is int) {
      return prefs.setInt(key, content);
    }
    if (content is double) {
      return prefs.setDouble(key, content);
    }
    if (content is List<String>) {
      return prefs.setStringList(key, content);
    }
    return false;
  }

  dynamic _fetch(String key) async {
    SharedPreferences prefs = await getSharedPreferences();
    final content = prefs.get(key);
    TGLog.d('TGSharedPreferences.get - key:[$key], value:[$content]');
    return content;
  }

  Future<bool> _remove(String key) async {
    SharedPreferences prefs = await getSharedPreferences();
    TGLog.d('TGSharedPreferences.remove - key:[$key]');
    return prefs.remove(key);
  }

  Future<bool> set(String key, dynamic value) async {
    return _save(key, value);
  }

  Future<dynamic> get(String key) async {
    return await _fetch(key);
  }

  Future<bool> remove(String key) async {
    return _remove(key);
  }
}
