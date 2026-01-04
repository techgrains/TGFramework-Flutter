import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/util/tg_flavor.dart';

/// TGFramework's Network related implementation
class TGNetUtil {
  /// Check site - going with google as standard
  static const _CHECK_SITE = "google.com";

  /// Checks if internet is available or not with default check site
  static Future<bool> isInternetAvailable({bool checkInMock = true}) async {
    return isReachable(_CHECK_SITE, checkInMock: checkInMock);
  }

  /// Checks if given site is reachable
  static Future<bool> isReachable(String site,
      {bool checkInMock = true}) async {
    if (checkInMock && TGFlavor.applyMock()) return true;

    if (kIsWeb) await isWebReachable();

    bool isAvailable = false;
    try {
      final result = await InternetAddress.lookup(site);
      isAvailable = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isAvailable = false;
    }
    TGLog.d(
        "TGNetUtil.isReachable('" + site + "') = " + isAvailable.toString());
    return isAvailable;
  }

  /// Checks internet and api health
  static Future<bool> apiHealthCheck(String site, {int timeout = 5}) async {
    try {
      if (site.indexOf("?") > -1) {
        site = site + "&";
      } else {
        site = site + "?";
      }

      site = site + "t=" + DateTime.now().millisecondsSinceEpoch.toString();
      http.Response response = await http.get(Uri.parse(site)).timeout(
        Duration(seconds: timeout),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );
      return (response.statusCode >= 200 && response.statusCode < 300);
    } catch (error) {
      return false;
    }
  }

  static Future<bool> isWebReachable() async {
    String site = "https://www.google.com";
    bool isAvailable = false;
    try {
      final result =
          await http.get(Uri.parse(site)).timeout(const Duration(seconds: 3));
      isAvailable = result.statusCode == 200;
    } catch (_) {
      isAvailable = false;
    }
    TGLog.d(
        "TGNetUtil.isWebReachable('" + site + "') = " + isAvailable.toString());
    return isAvailable;
  }
}
