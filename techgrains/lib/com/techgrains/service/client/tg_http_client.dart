import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// Import the platform-specific client factory: uses tg_http_client_web.dart on web, tg_http_client_io.dart elsewhere
import 'tg_http_client_io.dart' if (dart.library.html) 'tg_http_client_web.dart'
    as platform_client;

class TGHttpClient extends http.BaseClient {
  static bool badCertificateCallbackEnabled = false;
  static int connectionTimeoutInSeconds = 15;

  final Map<String, String> headers;
  static late http.Client _client;
  static bool _isClientInitialized = false;

  TGHttpClient({this.headers = const {}}) {
    if (_isClientInitialized) {
      return;
    }

    // Delegate client creation to the platform-specific factory
    _client = platform_client.createPlatformClient(
      badCertificateCallbackEnabled: badCertificateCallbackEnabled,
      connectionTimeoutInSeconds: connectionTimeoutInSeconds,
    );

    _isClientInitialized = true;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(headers);
    if (kIsWeb && connectionTimeoutInSeconds > 0) {
      return _client
          .send(request)
          .timeout(Duration(seconds: connectionTimeoutInSeconds));
    }
    return _client.send(request);
  }
}
