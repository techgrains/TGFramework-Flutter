import 'dart:async';

import 'package:flutter/services.dart';

class Techgrains {
  static const MethodChannel _channel =
      const MethodChannel('techgrains');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
