import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/listener/tg_session_listener.dart';

/// TGFramework's Session implementation
class TGSession {
  /// Singleton instance
  static TGSession _instance;

  /// Holds all key-values as Map
  Map<String, Object> _map;

  /// Holds all TGSession listeners
  Set<TGSessionListener> _listeners;

  /// Created At timestamp
  DateTime _createdAt;

  /// Gets TGSession's instance reference
  static TGSession getInstance() {
    if (_instance == null) _instance = new TGSession._();
    return _instance;
  }

  /// Private constructor
  TGSession._() {
    _init();
  }

  /// Initialize
  void _init() {
    TGLog.d("TGSession : init");
    _map = new Map();
    _createdAt = DateTime.now();
    _listeners = Set();
  }

  /// Sets value for given key
  void set(String key, dynamic value) {
    _listeners.forEach((listener) {
      listener.keySet(key);
    });
    this._map[key] = value;
  }

  /// Gets value for given key
  dynamic get(String key) {
    return this._map[key];
  }

  /// Removes value for given key
  dynamic remove(String key) {
    _listeners.forEach((listener) {
      listener.keyRemove(key);
    });
    return this._map.remove(key);
  }

  /// Invalidate session
  void invalidate() {
    _listeners.forEach((listener) {
      listener.invalidate();
    });
    _init();
  }

  /// Add listener
  void addListener(TGSessionListener listener) {
    if (listener != null) _listeners.add(listener);
  }

  /// Remove listener
  void removeListener(TGSessionListener listener) {
    if (listener != null) _listeners.remove(listener);
  }

  /// Remove all listeners
  void removeAllListeners() {
    _listeners.clear();
  }

  /// TGSession created at
  DateTime createdAt() {
    return _createdAt;
  }

  /// Number of milliseconds passed since valid TGSession has been created
  Duration validSince() {
    return DateTime.now().difference(_createdAt);
  }
}
