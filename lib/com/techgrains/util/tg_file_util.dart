import 'package:flutter/services.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';

/// TGFramework's File related implementation
class TGFileUtil {
  /// Reads file as String
  static Future<String> readFileAsString(String path) {
    TGLog.d("TGFileUtil.readFileAsString : " + path);
    return rootBundle.loadString(path);
  }
}
