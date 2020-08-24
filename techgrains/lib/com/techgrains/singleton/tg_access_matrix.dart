import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/model/tg_access_matrix_vo.dart';

/// TGFramework's Access Matrix implementation
class TGAccessMatrix {
  /// Singleton instance
  static TGAccessMatrix _instance;

  /// Flag Types
  static const int READ = 1;
  static const int UPDATE = 2;
  static const int DELETE = 4;
  static const int CREATE = 8;

  /// Holds all Access Matrix as List
  List<TGAccessMatrixVO> list;
  Map<String, Map<int, bool>>
      flags; // String: key~roleId, int: Flag Type, bool: flag

  /// Created At timestamp
  DateTime _createdAt;

  /// Gets TGAccessMatrix's instance reference
  static TGAccessMatrix getInstance() {
    if (_instance == null) _instance = new TGAccessMatrix._();
    return _instance;
  }

  /// Private constructor
  TGAccessMatrix._() {
    _init();
  }

  /// Initialize
  void _init() {
    TGLog.d("TGAccessMatrix : init");
    list = new List();
    flags = new Map();
    _createdAt = DateTime.now();
  }

  /// Add to Access Matrix list
  void addAll(List<TGAccessMatrixVO> list) {
    list.forEach((element) {
      add(element);
    });
  }

  /// Add individual Access Matrix
  void add(TGAccessMatrixVO accessMatrixVO) {
    list.add(accessMatrixVO);
    String mapKey = _mapKey(accessMatrixVO.key, accessMatrixVO.roleId);
    if (flags.containsKey(mapKey)) flags.remove(mapKey);
    flags.putIfAbsent(mapKey, () => _mapValue(accessMatrixVO));
  }

  String _mapKey(String key, int roleId) {
    return key + roleId.toString();
  }

  Map<int, bool> _mapValue(TGAccessMatrixVO accessMatrixVO) {
    return {
      READ: accessMatrixVO.read,
      UPDATE: accessMatrixVO.update,
      DELETE: accessMatrixVO.delete,
      CREATE: accessMatrixVO.create,
    };
  }

  /// Removes value for given key & role
  dynamic remove(String key, int roleId) {
    list.removeWhere(
        (element) => element.key == key && element.roleId == roleId);
  }

  /// Gets Read flag for given key and roles
  bool hasRead(String key, List<int> roleIds) {
    return _has(key, roleIds, READ);
  }

  /// Gets Update flag for given key and roles
  bool hasUpdate(String key, List<int> roleIds) {
    return _has(key, roleIds, UPDATE);
  }

  /// Gets Delete flag for given key and roles
  bool hasDelete(String key, List<int> roleIds) {
    return _has(key, roleIds, DELETE);
  }

  /// Gets Create flag for given key and roles
  bool hasCreate(String key, List<int> roleIds) {
    return _has(key, roleIds, CREATE);
  }

  /// Gets flag for given key, roles and flag type
  bool _has(String key, List<int> roleIds, int flagType) {
    for (int roleId in roleIds) {
      String mapKey = _mapKey(key, roleId);
      if (flags.containsKey(mapKey)) if (flags[mapKey][flagType]) return true;
    }
    return false;
  }

  /// Size of access matrix
  int size() {
    return list.length;
  }

  /// Invalidate access matrix
  void invalidate() {
    _init();
  }

  /// TGAccessMatrix created at
  DateTime createdAt() {
    return _createdAt;
  }

  /// Number of milliseconds passed since valid TGAccessMatrix has been created
  Duration validSince() {
    return DateTime.now().difference(_createdAt);
  }
}
