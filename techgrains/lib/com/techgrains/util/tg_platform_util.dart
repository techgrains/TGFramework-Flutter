import 'dart:io';

/// TGFramework's Platform related implementation
class TGPlatformUtil {
  static bool isMobile() {
    return Platform.isAndroid || Platform.isIOS;
  }

  static bool isComputer() {
    return Platform.isMacOS || Platform.isLinux || Platform.isWindows;
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
    return Platform.localeName;
  }

  static String localHostname() {
    return Platform.localHostname;
  }

  static String version() {
    return Platform.version;
  }

  static String operatingSystem() {
    return Platform.operatingSystem;
  }

  static String operatingSystemVersion() {
    return Platform.operatingSystemVersion;
  }

  static String packageConfig() {
    return Platform.packageConfig;
  }
}
