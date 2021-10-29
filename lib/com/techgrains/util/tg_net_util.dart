import 'dart:io';

import 'package:techgrains/com/techgrains/common/tg_log.dart';

/// TGFramework's Network related implementation
class TGNetUtil {
  /// Check site - going with google as standard
  static const _CHECK_SITE = "google.com";

  /// Checks if internet is available or not with default check site
  static Future<bool> isInternetAvailable() async {
    return isReachable(_CHECK_SITE);
  }

  /// Checks if given site is reachable
  static Future<bool> isReachable(String site) async {
    bool isAvailable = false;
    try {
      final result = await InternetAddress.lookup(site);
      isAvailable = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isAvailable = false;
    }
    TGLog.d("TGNetUtil.isReachable('" + site + "') = " + isAvailable.toString());
    return isAvailable;
  }
}
