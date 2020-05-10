import 'package:http/http.dart' as http;

class TGHttpClient extends http.BaseClient {
  final Map<String, String> headers;
  http.Client _client = new http.Client();

  TGHttpClient({this.headers = const {}});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(headers);
    return _client.send(request);
  }
}
