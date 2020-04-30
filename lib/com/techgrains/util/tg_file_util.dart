import 'package:flutter/services.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';

class TGFileUtil {
  static Future<String> readFileAsString(String path) {
    TGLog.d("TGFileUtil.readFileAsString : " + path);
    return rootBundle.loadString(path);
  }
}
