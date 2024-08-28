import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/listener/tg_session_listener.dart';

/// TGFramework's Session implementation
class TGSession {
  /// Singleton instance
  static TGSession _instance = new TGSession._();

  /// Holds all key-values as Map
  late Map<String, Object> _map;

  /// Holds all TGSession listeners
  late Set<TGSessionListener> _listeners;

  /// Created At timestamp
  DateTime? _createdAt;

  /// Created At timestamp
  static const String _validSuffix = 'ValidUntil';

  /// Gets TGSession's instance reference
  static TGSession getInstance() {
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

  String _withValidSuffix(String key) => key + _validSuffix;

  /// Sets value for given key with Duration
  void set(String key, dynamic value, {Duration? validFor}) {
    _listeners.forEach((listener) {
      listener.keySet(key);
    });

    this._map[key] = value;
    if (validFor != null) {
      this._map[_withValidSuffix(key)] =
          DateTime.now().add(validFor).toIso8601String();
    } else {
      if (this._map.containsKey(_withValidSuffix(key))) {
        this._map.remove(_withValidSuffix(key));
      }
    }
  }

  /// Gets value for given key if not expired
  dynamic get(String key) {
    if (this._map.containsKey(_withValidSuffix(key))) {
      String? validTimeStr = this._map[_withValidSuffix(key)] as String?;
      if (validTimeStr != null &&
          DateTime.parse(validTimeStr).isBefore(DateTime.now())) {
        this._map.remove(key);
      }
    }
    return this._map[key];
  }

  /// Removes value for given key
  dynamic remove(String key) {
    _listeners.forEach((listener) {
      listener.keyRemove(key);
    });

    if (this._map.containsKey(_withValidSuffix(key))) {
      this._map.remove(_withValidSuffix(key));
    }
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
  void addListener(TGSessionListener? listener) {
    if (listener != null) _listeners.add(listener);
  }

  /// Remove listener
  void removeListener(TGSessionListener? listener) {
    if (listener != null) _listeners.remove(listener);
  }

  /// Remove all listeners
  void removeAllListeners() {
    _listeners.clear();
  }

  /// TGSession created at
  DateTime? createdAt() {
    return _createdAt;
  }

  /// Number of milliseconds passed since valid TGSession has been created
  Duration validSince() {
    return DateTime.now().difference(_createdAt!);
  }
}
