// Platform-specific HTTP client for web.
// This file will only be used on web builds via conditional import.
import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http;

/// Returns a platform http.Client for web platforms.
http.Client createPlatformClient({
  bool badCertificateCallbackEnabled = false,
  int connectionTimeoutInSeconds = 15,
}) {
  // BrowserClient wraps the browser fetch API and doesn't honor bad certs or timeouts.
  return BrowserClient();
}
