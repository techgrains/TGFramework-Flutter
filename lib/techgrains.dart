import 'dart:async';

import 'package:flutter/services.dart';

/// Default dart
class Techgrains {
  /// Method channel : "techgrains"
  static const MethodChannel _channel = const MethodChannel('techgrains');

  /// Gets Platform's Version
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
