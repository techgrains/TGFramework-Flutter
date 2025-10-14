import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:universal_io/io.dart';

class TGHttpClient extends http.BaseClient {
  static bool badCertificateCallbackEnabled = false;
  static int connectionTimeoutInSeconds = 15;

  final Map<String, String> headers;
  static http.Client _client = new IOClient();
  static bool _isClientInitialized = false;

  TGHttpClient({this.headers = const {}}) {
    if (_isClientInitialized) {
      return;
    }
    HttpClient webHttpClient = new HttpClient();
    if (badCertificateCallbackEnabled) {
      webHttpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
    }
    if (connectionTimeoutInSeconds > 0) {
      webHttpClient.connectionTimeout =
          Duration(seconds: connectionTimeoutInSeconds);
    }
    _isClientInitialized = true;
    _client = new IOClient(webHttpClient);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(headers);
    return _client.send(request);
  }
}
