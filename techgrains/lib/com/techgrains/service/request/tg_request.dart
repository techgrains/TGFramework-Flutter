import 'package:techgrains/com/techgrains/common/tg_log.dart';

abstract class TGRequest {
  // Common across all the requests
  static String? defaultBaseUrl;
  static Map<String, String>? defaultHeaders;

  // Specific to the request and overrides overlapped default header
  Map<String, String>? customHeaders;

  String? getBaseUrl() {
    return defaultBaseUrl;
  }

  String getUri();

  Map<String, String>? headers() {
    Map<String, String> headers = new Map();
    if (defaultHeaders != null) {
      headers.addAll(defaultHeaders!);
    }
    if (customHeaders != null) {
      headers.addAll(customHeaders!);
    }
    return headers;
  }

  String getUrl() {
    String uri = getUri();
    String? url = defaultBaseUrl;
    if (url == null || url.length == 0) {
      TGLog.e(
          "Set baseUrl once: TGService.init(baseUrl: 'https://api.product.com/v1')");
    }
    return prepareUrl(url, uri);
  }

  static String prepareUrl(String? url, String? uri) {
    if (url == null) url = "";
    if (uri == null) uri = "";

    // Ignores Url if uri itself is full URL
    if (uri.startsWith("http:")) return uri;

    if (!uri.startsWith("/")) uri = "/" + uri;
    if (url.endsWith("/")) url = url.substring(0, url.length - 1);
    return url + uri;
  }
}
