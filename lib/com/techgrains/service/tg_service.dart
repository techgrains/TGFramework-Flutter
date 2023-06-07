import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/service/client/tg_client_factory.dart';
import 'package:techgrains/com/techgrains/service/client/tg_http_client.dart';
import 'package:techgrains/com/techgrains/service/error/tg_error.dart';
import 'package:techgrains/com/techgrains/service/mock/tg_mock_service.dart';
import 'package:techgrains/com/techgrains/service/request/tg_delete_request.dart';
import 'package:techgrains/com/techgrains/service/request/tg_get_request.dart';
import 'package:techgrains/com/techgrains/service/request/tg_post_request.dart';
import 'package:techgrains/com/techgrains/service/request/tg_put_request.dart';
import 'package:techgrains/com/techgrains/service/request/tg_request.dart';
import 'package:techgrains/com/techgrains/service/request/tg_request_content.dart';
import 'package:techgrains/com/techgrains/service/request/tg_upload_file_request.dart';
import 'package:techgrains/com/techgrains/service/request/tg_upload_request.dart';
import 'package:techgrains/com/techgrains/service/response/tg_response.dart';

typedef T CreatorT<T>();
typedef E CreatorE<E>();

class TGService<T extends TGResponse, E extends TGError> {
  CreatorT<T> creatorT;
  CreatorE<E> creatorE;

  TGService(this.creatorT, this.creatorE);

  Client _getClient(String url, String method) =>
      TGClientFactory.getClient(url, method);

  static init(
      {required String baseUrl,
      Map<String, String>? headers,
      String? mockMappingsFile,
      bool applyMock = false,
      bool badCertificateCallbackEnabled = false,
      int connectionTimeoutInSeconds = 15}) {
    // For HTTP Request
    TGRequest.defaultBaseUrl = baseUrl;
    TGRequest.defaultHeaders = headers;

    // For Mock
    TGMockService.applyMock = applyMock;
    if (mockMappingsFile != null && applyMock)
      TGMockService.loadMockMappings(mockMappingsFile);

    // For HTTP Client
    TGHttpClient.badCertificateCallbackEnabled = badCertificateCallbackEnabled;
    TGHttpClient.connectionTimeoutInSeconds = connectionTimeoutInSeconds;
  }

  Future<T> get(
      {required TGGetRequest request, onSuccess(T)?, onError(T)?}) async {
    try {
      Uri uri = Uri.parse(request.getUrl());
      TGLog.t("GET", uri);
      final httpRes = await _getClient(request.getUri(), "GET")
          .get(uri, headers: request.headers());
      return _performCallback(httpRes, onError, onSuccess);
    } catch (error) {
      T t = _populateExceptionResponse(error);
      onError!(t);
      return t;
    }
  }

  Future<T> getSync({required TGGetRequest request}) async {
    try {
      Uri uri = Uri.parse(request.getUrl());
      TGLog.t("GET", uri);
      final httpRes = await _getClient(request.getUri(), "GET")
          .get(uri, headers: request.headers());
      return Future.value(_prepareResponse(httpRes));
    } catch (error) {
      T t = _populateExceptionResponse(error);
      return Future.value(t);
    }
  }

  Future<T> post(
      {required TGPostRequest request, onSuccess(T)?, onError(T)?}) async {
    try {
      Uri uri = Uri.parse(request.getUrl());
      TGLog.t("POST", uri);
      TGRequestContent content =
          TGRequestContent(request.body(), request.headers());
      final httpRes = await _getClient(request.getUri(), "POST").post(
        uri,
        body: content.body,
        headers: content.headers,
      );
      return _performCallback(httpRes, onError, onSuccess);
    } catch (error) {
      T t = _populateExceptionResponse(error);
      onError!(t);
      return t;
    }
  }

  Future<T> postSync({required TGPostRequest request}) async {
    try {
      Uri uri = Uri.parse(request.getUrl());
      TGLog.t("POST", uri);
      TGRequestContent content =
          TGRequestContent(request.body(), request.headers());
      final httpRes = await _getClient(request.getUri(), "POST").post(
        uri,
        body: content.body,
        headers: content.headers,
      );
      return Future.value(_prepareResponse(httpRes));
    } catch (error) {
      T t = _populateExceptionResponse(error);
      return Future.value(t);
    }
  }

  Future<T> put(
      {required TGPutRequest request, onSuccess(T)?, onError(T)?}) async {
    try {
      Uri uri = Uri.parse(request.getUrl());
      TGLog.t("PUT", uri);
      TGRequestContent content =
          TGRequestContent(request.body(), request.headers());
      final httpRes = await _getClient(request.getUri(), "PUT").put(
        uri,
        body: content.body,
        headers: content.headers,
      );
      return _performCallback(httpRes, onError, onSuccess);
    } catch (error) {
      T t = _populateExceptionResponse(error);
      onError!(t);
      return t;
    }
  }

  Future<T> delete(
      {required TGDeleteRequest request, onSuccess(T)?, onError(T)?}) async {
    try {
      Uri uri = Uri.parse(request.getUrl());
      TGLog.t("DELETE", uri);
      final httpRes = await _getClient(request.getUri(), "DELETE").delete(
        uri,
        body: request.body(),
        headers: request.headers(),
      );
      return _performCallback(httpRes, onError, onSuccess);
    } catch (error) {
      T t = _populateExceptionResponse(error);
      onError!(t);
      return t;
    }
  }

  Future<T> upload(
      {required TGUploadRequest request, onSuccess(T)?, onError(T)?}) async {
    try {
      var multipartRequest = http.MultipartRequest(
          "POST",
          Uri.parse(TGRequest.prepareUrl(
              TGRequest.defaultBaseUrl, request.getUri())));
      multipartRequest.files.add(request.file());
      StreamedResponse httpRes = await multipartRequest.send();
      return _performCallbackForStreamedResponse(httpRes, onError, onSuccess);
    } catch (error) {
      T t = _populateExceptionResponse(error);
      onError!(t);
      return t;
    }
  }

  Future<T> uploadFile(
      {required TGUploadFileRequest request,
      onSuccess(T)?,
      onError(E)?}) async {
    try {
      var multipartRequest = http.MultipartRequest(
          "POST",
          Uri.parse(TGRequest.prepareUrl(
              TGRequest.defaultBaseUrl, request.getUri())));
      multipartRequest.headers.addAll(request.headers()!);
      multipartRequest.fields.addAll(request.body());
      multipartRequest.files.addAll(request.files());
      StreamedResponse httpRes = await multipartRequest.send();
      return _performCallbackForUploadFileResponse(httpRes, onError, onSuccess);
    } catch (error) {
      T t = _populateExceptionResponse(error);
      onError!(t);
      return t;
    }
  }

  Future<T> uploadFileSync({required TGUploadFileRequest request}) async {
    try {
      var multipartRequest = http.MultipartRequest(
          "POST",
          Uri.parse(TGRequest.prepareUrl(
              TGRequest.defaultBaseUrl, request.getUri())));
      multipartRequest.headers.addAll(request.headers()!);
      multipartRequest.fields.addAll(request.body());
      multipartRequest.files.addAll(request.files());
      StreamedResponse httpRes = await multipartRequest.send();
      return Future.value(_performCallbackForUploadFileSyncResponse(httpRes));
    } catch (error) {
      T t = _populateExceptionResponse(error);
      return Future.value(t);
    }
  }

  T _performCallback(
      Response httpRes, onError(dynamic T)?, onSuccess(dynamic T)?) {
    T t = _prepareResponse(httpRes);
    t.hasError ? onError!(t) : onSuccess!(t);
    return t;
  }

  T _performCallbackForStreamedResponse(
      StreamedResponse httpRes, onError(dynamic T)?, onSuccess(dynamic T)?) {
    T t = creatorT();
    try {
      _populateResponse(t, httpRes);
      t.body = httpRes.toString();
      _validateResponse(t);
    } catch (e) {
      TGLog.e(e);
      // Ignores error if not able to populate response, validate response or decode json. Populated response must be returned.
    }
    t.hasError ? onError!(t) : onSuccess!(t);
    return t;
  }

  Future<T> _performCallbackForUploadFileResponse(StreamedResponse httpRes,
      onError(dynamic E)?, onSuccess(dynamic T)?) async {
    T t = creatorT();
    try {
      _populateResponse(t, httpRes);
      t.body = await httpRes.stream.bytesToString();
      _validateResponse(t);
    } catch (e) {
      TGLog.e(e);
      // Ignores error if not able to populate response, validate response or decode json. Populated response must be returned.
    }
    if (t.hasError) {
      E e = creatorE();
      final timestamp = new DateTime.now().millisecondsSinceEpoch;
      final errorResponse = {
        "httpStatus": httpRes.statusCode,
        "timestamp": timestamp,
        "message": t.body!
      };
      onError!(e.fromJson(errorResponse));
    } else {
      onSuccess!(t);
    }
    return t;
  }

  Future<T> _performCallbackForUploadFileSyncResponse(
      StreamedResponse httpRes) async {
    T t = creatorT();
    try {
      _populateResponse(t, httpRes);
      t.body = await httpRes.stream.bytesToString();
      _validateResponse(t);
    } catch (e) {
      TGLog.e(e);
      // Ignores error if not able to populate response, validate response or decode json. Populated response must be returned.
    }
    return t;
  }

  T _prepareResponse(Response httpRes) {
    T t = creatorT();
    try {
      _populateResponse(t, httpRes);
      t.body = httpRes.body;
      _validateResponse(t);
    } catch (e) {
      TGLog.e(e);
      // Ignores error if not able to populate response, validate response or decode json. Populated response must be returned.
    }
    return t;
  }

  T _populateExceptionResponse(error) {
    T t = creatorT();
    t.timestamp = new DateTime.now().millisecondsSinceEpoch;
    t.httpStatus = 0;
    t.contentLength = 0;
    t.error = error.message;
    t.body = error.message;
    t.hasError = true;
    return t;
  }

  void _populateResponse(t, http.BaseResponse httpRes) {
    t.timestamp = new DateTime.now().millisecondsSinceEpoch;
    t.httpStatus = httpRes.statusCode;
    t.contentLength = httpRes.contentLength;
    t.headers = httpRes.headers;
  }

  void _validateResponse(T t) {
    t.validate(); // Populates hasError based on HTTP Status Code
    if (t.body != null && t.body!.isNotEmpty) {
      try {
        if (t.hasError) {
          t.error = creatorE().fromJson(jsonDecode(t.body!));
        } else {
          t.fromJson(jsonDecode(t.body!));
        }
      } catch (e) {
        TGLog.e("Unable to prepare - " +
            (t.hasError ? E.toString() : T.toString()));
        TGLog.e("Please check 'fromJson(dynamic json)' implementation of - " +
            (t.hasError ? E.toString() : T.toString()));
        TGLog.e(e);
        t.hasError = true;
        print(t.body);
      }
    }
  }
}
