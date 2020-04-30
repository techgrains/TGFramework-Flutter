import 'dart:io';

import 'package:techgrains/com/techgrains/common/tg_log.dart';

/// TGFramework's Network related implementation
class TGNetUtil {
  /// Check site - going with google as standard
  static const _CHECK_SITE = "google.com";

  /// Checks if internet is available or not
  static Future<bool> isInternetAvailable() async {
    bool isAvailable = false;
    try {
      final result = await InternetAddress.lookup(_CHECK_SITE);
      isAvailable = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isAvailable = false;
    }
    TGLog.d("TGNetUtil.isInternetAvailable = " + isAvailable.toString());
    return isAvailable;
  }
}
