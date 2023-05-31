import 'dart:io';
import 'dart:convert';

class TGRequestContent {
  Object? body;
  Map<String, String>? headers;

  TGRequestContent(String? body, Map<String, String>? headers) {
    this.headers = headers;
    if (_isContentEncodingGZip(headers)) {
      List<int> compressed = GZipCodec().encode(utf8.encode(body!));
      this.headers?.addAll({'Content-Length': compressed.length.toString()});
      this.body = compressed;
    } else {
      this.body = body;
    }
  }

  bool _isContentEncodingGZip(Map<String, String>? headers) {
    return headers!.containsKey('Content-Encoding') &&
        headers['Content-Encoding'] == 'gzip';
  }
}
