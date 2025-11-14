// Platform-specific HTTP client for non-web (IO) platforms.
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

/// Returns a platform http.Client for non-web platforms.
http.Client createPlatformClient({
  bool badCertificateCallbackEnabled = false,
  int connectionTimeoutInSeconds = 15,
}) {
  final httpClient = HttpClient();

  if (badCertificateCallbackEnabled) {
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  }

  if (connectionTimeoutInSeconds > 0) {
    httpClient.connectionTimeout =
        Duration(seconds: connectionTimeoutInSeconds);
  }

  return IOClient(httpClient);
}
