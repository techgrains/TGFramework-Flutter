import 'dart:io';

/// TGFramework's Platform related implementation
class TGPlatformUtil {
  static bool isApp() {
    try {
      return Platform.isAndroid || Platform.isIOS;
    } catch (e) {
      return false;
    }
  }

  static bool isDesktop() {
    try {
      return Platform.isMacOS || Platform.isLinux || Platform.isWindows;
    } catch (e) {
      return false;
    }
  }

  static bool isWeb() {
    try {
      return isApp() || isDesktop();
    } catch (e) {
      return true;
    }
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isFuchsia() {
    return Platform.isFuchsia;
  }

  static bool isMacOS() {
    return Platform.isMacOS;
  }

  static bool isLinux() {
    return Platform.isLinux;
  }

  static bool isWindows() {
    return Platform.isWindows;
  }

  static String localeName() {
    try {
      return Platform.localeName;
    } catch (e) {
      return "";
    }
  }

  static String localHostname() {
    try {
      return Platform.localHostname;
    } catch (e) {
      return "";
    }
  }

  static String version() {
    try {
      return Platform.version;
    } catch (e) {
      return "";
    }
  }

  static String operatingSystem() {
    try {
      return Platform.operatingSystem;
    } catch (e) {
      return "";
    }
  }

  static String operatingSystemVersion() {
    try {
      return Platform.operatingSystemVersion;
    } catch (e) {
      return "";
    }
  }

  static String? packageConfig() {
    try {
      return Platform.packageConfig;
    } catch (e) {
      return "";
    }
  }
}
