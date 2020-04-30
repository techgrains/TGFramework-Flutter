import 'package:shared_preferences/shared_preferences.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';

/// TGFramework's Shared Preferences implementation
class TGSharedPreferences {
  /// Singleton instance
  static TGSharedPreferences _instance;

  /// Gets TGSharedPreferences's instance reference
  static TGSharedPreferences getInstance() {
    if (_instance == null) {
      _instance = new TGSharedPreferences._();
    }
    return _instance;
  }

  /// Private constructor
  TGSharedPreferences._() {
    TGLog.d("TGSharedPreferences : Initiated");
  }

  /// Gets instance of SharedPreferences
  Future<SharedPreferences> _getSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  /// Saves content for given key
  Future<bool> _save<T>(String key, T content) async {
    SharedPreferences prefs = await _getSharedPreferences();
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

  /// Fetches value for given key
  dynamic _fetch(String key) async {
    SharedPreferences prefs = await _getSharedPreferences();
    final content = prefs.get(key);
    TGLog.d('TGSharedPreferences.get - key:[$key], value:[$content]');
    return content;
  }

  /// Removes content for given key
  Future<bool> _remove(String key) async {
    SharedPreferences prefs = await _getSharedPreferences();
    TGLog.d('TGSharedPreferences.remove - key:[$key]');
    return prefs.remove(key);
  }

  /// Sets content for given key
  Future<bool> set(String key, dynamic value) async {
    return _save(key, value);
  }

  /// Gets content for given key
  Future<dynamic> get(String key) async {
    return await _fetch(key);
  }

  /// Removes content for given key
  Future<bool> remove(String key) async {
    return _remove(key);
  }
}
