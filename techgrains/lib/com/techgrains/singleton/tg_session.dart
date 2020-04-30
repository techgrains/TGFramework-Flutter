import 'package:techgrains/com/techgrains/common/tg_log.dart';

/// TGFramework's Session implementation
class TGSession {
  /// Singleton instance
  static TGSession _instance;

  /// Holds all key-values as Map
  Map<String, Object> _map;

  /// Gets TGSession's instance reference
  static TGSession getInstance() {
    if (_instance == null) {
      _instance = new TGSession._();
    }
    return _instance;
  }

  /// Private constructor
  TGSession._() {
    TGLog.d("TGSession : Initiated");
    _map = new Map();
  }

  /// Sets value for given key
  void set(String key, dynamic value) {
    this._map[key] = value;
  }

  /// Gets value for given key
  dynamic get(String key) {
    return this._map[key];
  }

  /// Removes value for given key
  dynamic remove(String key) {
    return this._map.remove(key);
  }
}
