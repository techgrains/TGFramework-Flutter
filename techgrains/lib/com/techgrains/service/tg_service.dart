import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/service/client/tg_client_factory.dart';
import 'package:techgrains/com/techgrains/service/error/tg_error.dart';
import 'package:techgrains/com/techgrains/service/mock/tg_mock_service.dart';
import 'package:techgrains/com/techgrains/service/request/tg_delete_request.dart';
import 'package:techgrains/com/techgrains/service/request/tg_get_request.dart';
import 'package:techgrains/com/techgrains/service/request/tg_post_request.dart';
import 'package:techgrains/com/techgrains/service/request/tg_put_request.dart';
import 'package:techgrains/com/techgrains/service/request/tg_request.dart';
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
      {String baseUrl,
      Map<String, String> headers,
      String mockMappingsFile,
      bool applyMock = false}) {
    TGRequest.defaultBaseUrl = baseUrl;
    TGRequest.defaultHeaders = headers;

    // For Mock
    TGMockService.applyMock = applyMock;
    TGMockService.loadMockMappings(mockMappingsFile);
  }

  Future<T> get(
      {@required TGGetRequest request,
      Function onSuccess(T),
      Function onError(T)}) async {
    String url = request.getUrl();
    TGLog.t("GET", url);
    final httpRes = await _getClient(request.getUri(), "GET")
        .get(url, headers: request.headers());
    return _performCallback(httpRes, onError, onSuccess);
  }

  Future<T> post(
      {@required TGPostRequest request,
      Function onSuccess(T),
      Function onError(T)}) async {
    String url = request.getUrl();
    TGLog.t("POST", url);
    final httpRes = await _getClient(request.getUri(), "POST").post(
      url,
      body: request.body(),
      headers: request.headers(),
    );
    return _performCallback(httpRes, onError, onSuccess);
  }

  Future<T> put(
      {@required TGPutRequest request,
      Function onSuccess(T),
      Function onError(T)}) async {
    String url = request.getUrl();
    TGLog.t("PUT", url);
    final httpRes = await _getClient(request.getUri(), "PUT").put(
      url,
      body: request.body(),
      headers: request.headers(),
    );
    return _performCallback(httpRes, onError, onSuccess);
  }

  Future<T> delete(
      {@required TGDeleteRequest request,
      Function onSuccess(T),
      Function onError(T)}) async {
    String url = request.getUrl();
    TGLog.t("DELETE", url);
    final httpRes = await _getClient(request.getUri(), "DELETE")
        .delete(url, headers: request.headers());
    return _performCallback(httpRes, onError, onSuccess);
  }

  T _performCallback(Response httpRes, Function onError(dynamic T),
      Function onSuccess(dynamic T)) {
    T t = _prepareResponse(httpRes);
    t.hasError ? onError(t) : onSuccess(t);
    return t;
  }

  T _prepareResponse(Response httpRes) {
    T t = creatorT();
    try {
      _populateResponse(t, httpRes);
      _validateResponse(t);
    } catch (e) {
      TGLog.e(e);
      // Ignores error if not able to populate response, validate response or decode json.
    }
    return t;
  }

  void _populateResponse(T t, Response httpRes) {
    t.timestamp = new DateTime.now().millisecondsSinceEpoch;
    t.httpStatus = httpRes.statusCode;
    t.contentLength = httpRes.contentLength;
    t.headers = httpRes.headers;
    t.body = httpRes.body;
  }

  void _validateResponse(T t) {
    t.validate(); // Populates hasError based on HTTP Status Code
    if (t.body != null && t.body.isNotEmpty) {
      if (t.hasError) {
        t.error = creatorE().fromJson(jsonDecode(t.body));
      } else {
        t.fromJson(jsonDecode(t.body));
      }
    }
  }
}
