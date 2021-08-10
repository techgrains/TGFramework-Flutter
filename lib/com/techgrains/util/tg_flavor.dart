import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/common/tg_log_level.dart';
import 'package:techgrains/com/techgrains/model/tg_flavor_vo.dart';
import 'package:techgrains/com/techgrains/util/tg_file_util.dart';

/// Environment Config
class TGEnvConfig {
  static const String APP_FLAVOR = String.fromEnvironment('app.flavor');
  static const String FLAVOR = String.fromEnvironment('flavor');
}

/// TGFramework's Flavor implementation
class TGFlavor {
  static List<TGFlavorVO>? _flavors;
  static TGFlavorVO? _current;

  /// Initialize
  static void init(String flavorsConfigFile) {
    TGLog.d("TGFlavor : init");
    _load(flavorsConfigFile);
  }

  /// Load Flavors & Setup
  static void _load(String flavorsConfigFile) {
    TGLog.d("TGFlavor._load");
    _loadFlavors(flavorsConfigFile);
  }

  /// Load Flavors
  static Future<void> _loadFlavors(String flavorsConfigFile) async {
    TGLog.d("TGFlavor._loadFlavors");
    TGLog.d("Loading... $flavorsConfigFile");
    if (flavorsConfigFile.length >= 0) {
      try {
        List jsonList = await TGFileUtil.readJsonFileAsList(flavorsConfigFile);
        _flavors = jsonList
            .map<TGFlavorVO>((json) => TGFlavorVO.fromJson(json))
            .toList();
        _loadCurrentFlavor();
      } catch (error) {
        TGLog.e("- - - - - - - - - - - - - - - - - - - - - - -");
        TGLog.e("[ATTN] Flavors configuration file is invalid.");
        TGLog.e("- - - - - - - - - - - - - - - - - - - - - - -");
        TGLog.e(error);
      }
    } else {
      TGLog.e("- - - - - - - - - - - - - - - - - - - - - -");
      TGLog.e("[ATTN] Flavors configuration file is empty.");
      TGLog.e("- - - - - - - - - - - - - - - - - - - - - -");
    }
  }

  /// Load Current Flavor
  static void _loadCurrentFlavor() {
    TGLog.d("TGFlavor._loadCurrentFlavor");
    String paramFlavor = _prepareParamFlavor();
    TGLog.d("Argument for flavor = $paramFlavor");

    if (paramFlavor.length == 0) {
      _current = _flavors![0];
    } else {
      // Iterate flavors and match it with provided app flavor
      _flavors!.forEach((flavor) {
        if (paramFlavor.toUpperCase() == flavor.flavor!.toUpperCase())
          _current = flavor;
      });

      // If app flavor doesn't match with provided flavors, take the first flavor from the list as default
      if (_current == null) {
        _current = _flavors![0];
      }
    }

    // Set logLevel to TGLog
    if (_current != null) {
      TGLog.i("- - - - - - - - - - - - - - - - - - - - - - -");
      TGLog.i(" flavor = " + _current!.flavor.toString());
      TGLog.i(" baseUrl = " + _current!.baseUrl.toString());
      TGLog.i(" logLevel = " + _current!.logLevel.toString());
      TGLog.i(" applyMock = " + _current!.applyMock.toString());
      if (_current!.applyMock == true)
        TGLog.i(" mockMappingsFile = " + _current!.mockMappingsFile.toString());
      TGLog.i(" params = " + _current!.params.toString());
      TGLog.i("- - - - - - - - - - - - - - - - - - - - - - -");
      if (_current!.logLevel != null) TGLog.setLogLevel(_current!.logLevel!);
    } else {
      TGLog.e("- - - - - - - - - - - - - - - - - - - - - -");
      TGLog.e("[ATTN] Unable to load flavor configuration.");
      TGLog.e("- - - - - - - - - - - - - - - - - - - - - -");
    }
  }

  static String _prepareParamFlavor() {
    if (TGEnvConfig.APP_FLAVOR.length > 0) return TGEnvConfig.APP_FLAVOR;
    if (TGEnvConfig.FLAVOR.length > 0) return TGEnvConfig.FLAVOR;
    return "";
  }

  /// Gets Base Url
  static String baseUrl() {
    String? baseUrl = _current?.baseUrl;
    return baseUrl == null ? "" : baseUrl;
  }

  /// Gets Base Url
  static TGLogLevel? logLevel() {
    TGLogLevel? logLevel = _current?.logLevel;
    return logLevel == null ? TGLogLevel.DEBUG : logLevel;
  }

  /// Gets param value for given key
  static dynamic param(String key) {
    Map<String, dynamic>? params = _current!.params;
    if (params == null) return null;
    return params[key];
  }

  /// Gets Apply Mock
  static bool applyMock() {
    return _current!.applyMock!;
  }

  /// Gets Base Url
  static String mockMappingsFile() {
    String? mockMappingsFile = _current?.mockMappingsFile;
    return mockMappingsFile == null ? "" : mockMappingsFile;
  }
}
