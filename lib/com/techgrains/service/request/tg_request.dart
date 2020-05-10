import 'package:techgrains/com/techgrains/common/tg_log.dart';

abstract class TGRequest {
  static Map<String, String> defaultHeaders;
  static String defaultBaseUrl;

  String getBaseUrl() {
    return defaultBaseUrl;
  }

  String getUri();

  Map<String, String> headers() {
    return defaultHeaders;
  }

  String getUrl() {
    String uri = getUri();
    String url = defaultBaseUrl;
    if (url == null || url.length == 0) {
      TGLog.e(
          "Set baseUrl once: TGService.init(baseUrl: 'https://api.product.com/v1')");
    }
    return prepareUrl(url, uri);
  }

  static String prepareUrl(String url, String uri) {
    if (url == null) url = "";
    if (uri == null) uri = "";

    // Ignores Url if uri itself is full URL
    if (uri.startsWith("http:")) return uri;

    if (!uri.startsWith("/")) uri = "/" + uri;
    if (url.endsWith("/")) url = url.substring(0, url.length - 1);
    return url + uri;
  }
}
