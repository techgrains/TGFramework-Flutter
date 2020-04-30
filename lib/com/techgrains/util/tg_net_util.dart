import 'dart:io';

import 'package:techgrains/com/techgrains/common/tg_log.dart';

class TGNetUtil {
  static const _CHECK_SITE = "google.com";

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
