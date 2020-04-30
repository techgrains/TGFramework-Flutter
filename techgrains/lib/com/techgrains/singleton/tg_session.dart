import 'package:techgrains/com/techgrains/common/tg_log.dart';

class TGSession {
  static TGSession _instance;

  Map<String, Object> _map;

  static TGSession getInstance() {
    if (_instance == null) {
      _instance = new TGSession._();
    }
    return _instance;
  }

  TGSession._() {
    TGLog.d("TGSession : Initiated");
    _map = new Map();
  }

  void set(String key, dynamic value) {
    this._map[key] = value;
  }

  dynamic get(String key) {
    return this._map[key];
  }

  dynamic remove(String key) {
    return this._map.remove(key);
  }
}
