import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/service/request/tg_post_request.dart';
import 'package:techgrains/com/techgrains/service/tg_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  tearDown(() {});

  test('check request body', () async {
    TGPostRequest request = TestRequest(param: "Test Param");
    String requestBody = request.body();
    String expectedBody = "{\"param\":\"Test Param\"}";
    TGLog.d("request.body() = " + request.body());
    assert(expectedBody == requestBody);
  });

  test('only default headers', () async {
    TGService.init(baseUrl: "https://base.url", headers: defaultHeaders());
    TGPostRequest request = TestRequest(param: "");

    TGLog.d("headers = ${request.headers()}");
    TGLog.d("headers.length = ${request.headers()!.length}");
    assert(2 == request.headers()?.length);
  });

  test('only custom headers', () async {
    TGService.init(baseUrl: "https://base.url");

    TGPostRequest request = TestRequest(param: "");
    request.customHeaders = {'Content-Encoding': 'gzip'};

    TGLog.d("headers = ${request.headers()}");
    TGLog.d("headers.length = ${request.headers()!.length}");
    assert(1 == request.headers()?.length);
  });

  test('default & custom headers', () async {
    TGService.init(baseUrl: "https://base.url", headers: defaultHeaders());
    TGPostRequest request = TestRequest(param: "");
    request.customHeaders = {
      'Content-Encoding': 'gzip',
      'Accept-Charset': 'iso-8859-5'
    };

    Map<String, String>? headers = request.headers();
    TGLog.d("headers = $headers");
    TGLog.d("headers.length = ${headers?.length}");
    assert(3 == headers?.length);
    assert('gzip' == headers?['Content-Encoding']);
  });
}

Map<String, String> defaultHeaders() {
  Map<String, String> headers = {};
  headers['Content-Type'] = 'application/json';
  headers['Content-Encoding'] = 'br';
  return headers;
}

class TestRequest extends TGPostRequest {
  String? param;

  TestRequest({this.param});

  Map<String, dynamic> toJson() => {
        'param': param,
      };

  @override
  String getUri() {
    return "/sample";
  }

  String body() {
    return json.encode(toJson());
  }
}
