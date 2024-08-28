import 'package:shared_preferences/shared_preferences.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/listener/tg_shared_preferences_listener.dart';

/// TGFramework's Shared Preferences implementation
class TGSharedPreferences {
  /// Singleton instance
  static TGSharedPreferences _instance = new TGSharedPreferences._();

  /// Holds all TGSharedPreferences listeners
  late Set<TGSharedPreferencesListener> _listeners;

  /// Created At timestamp
  DateTime? _createdAt;

  /// Created At timestamp
  static const String _validSuffix = 'ValidUntil';

  /// Gets TGSharedPreferences' instance reference
  static TGSharedPreferences getInstance() {
    return _instance;
  }

  /// Private constructor
  TGSharedPreferences._() {
    _init();
  }

  /// Initialize
  void _init() {
    TGLog.d("TGSharedPreferences : init");
    _createdAt = DateTime.now();
    _listeners = Set();
  }

  /// Gets instance of SharedPreferences
  Future<SharedPreferences> _getSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  String _withValidSuffix(String key) => key + _validSuffix;

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
    if (!prefs.containsKey(key)) {
      return null;
    }

    final content = prefs.get(key);
    TGLog.d('TGSharedPreferences.get - key:[$key], value:[$content]');
    return content;
  }

  /// Removes content for given key
  Future<bool> _remove(String key) async {
    SharedPreferences prefs = await _getSharedPreferences();
    if (!prefs.containsKey(key)) {
      return false;
    }
    TGLog.d('TGSharedPreferences.remove - key:[$key]');
    return prefs.remove(key);
  }

  /// Sets content for given key with Duration
  Future<bool> set(String key, dynamic value, {Duration? validFor}) async {
    _listeners.forEach((listener) {
      listener.keySet(key);
    });
    if (validFor != null) {
      _save(_withValidSuffix(key),
          DateTime.now().add(validFor).toIso8601String());
    } else {
      SharedPreferences prefs = await _getSharedPreferences();
      if (prefs.containsKey(_withValidSuffix(key))) {
        prefs.remove(_withValidSuffix(key));
      }
    }
    return _save(key, value);
  }

  /// Gets content for given key
  Future<dynamic> get(String key) async {
    SharedPreferences prefs = await _getSharedPreferences();
    if (prefs.containsKey(_withValidSuffix(key))) {
      String? validTimeStr = prefs.getString(_withValidSuffix(key));
      if (validTimeStr != null &&
          DateTime.parse(validTimeStr).isBefore(DateTime.now())) {
        prefs.remove(key);
      }
    }
    return await _fetch(key);
  }

  /// Removes content for given key
  Future<bool> remove(String key) async {
    _listeners.forEach((listener) {
      if (_listeners.contains(key as Object)) {
        listener.keyRemove(key);
      }
    });

    SharedPreferences prefs = await _getSharedPreferences();
    if (prefs.containsKey(_withValidSuffix(key))) {
      prefs.remove(_withValidSuffix(key));
    }
    return _remove(key);
  }

  /// Reloads Shared Preference
  Future<void> reload() async {
    SharedPreferences prefs = await _getSharedPreferences();
    prefs.reload();
  }

  /// Add listener
  void addListener(TGSharedPreferencesListener? listener) {
    if (listener != null) _listeners.add(listener);
  }

  /// Remove listener
  void removeListener(TGSharedPreferencesListener? listener) {
    if (listener != null) _listeners.remove(listener);
  }

  /// Remove all listeners
  void removeAllListeners() {
    _listeners.clear();
  }

  /// TGSharedPreferences created at
  DateTime? createdAt() {
    return _createdAt;
  }

  /// Number of milliseconds passed since valid TGSharedPreferences has been created
  Duration validSince() {
    return DateTime.now().difference(_createdAt!);
  }
}
