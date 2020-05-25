import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class TGHttpClient extends http.BaseClient {
  static bool badCertificateCallbackEnabled = false;

  final Map<String, String> headers;
  http.Client _client = new http.Client();

  TGHttpClient({this.headers = const {}}) {
    HttpClient webHttpClient = new HttpClient();
    if (badCertificateCallbackEnabled)
      webHttpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
    _client = new IOClient(webHttpClient);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(headers);
    return _client.send(request);
  }
}
