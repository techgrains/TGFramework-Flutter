import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:yaml/yaml.dart';

/// TGFramework's File related implementation
class TGFileUtil {
  /// Reads file as String
  static Future<String> readFile(String path) {
    TGLog.d("TGFileUtil.readFileAsString : " + path);
    return rootBundle.loadString(path);
  }

  /// Read JSon file as Map
  static Future<Map<String, dynamic>> readJsonFile(String jsonFile) async {
    try {
      String jsonString = await TGFileUtil.readFile(jsonFile);
      return json.decode(jsonString);
    } catch (e) {
      TGLog.e("Unable to load " + jsonFile);
    }
    return <String, dynamic>{};
  }

  /// Read JSon file as Map specifically for provided group and subgroup
  static Future<Map<String, dynamic>> readYamlFile(String yamlFile,
      {String group, String subGroup}) async {
    try {
      String fileAsString = await TGFileUtil.readFile(yamlFile);
      final Map map = loadYaml(fileAsString);

      if (group == null || group.length == 0) return map;

      // Group entries
      Map<String, dynamic> groupMap = <String, dynamic>{};
      for (MapEntry<String, dynamic> entry in map[group].entries)
        groupMap[entry.key] = entry.value;

      if (subGroup == null || subGroup.length == 0) return groupMap;

      // Sub Group entries
      Map<String, dynamic> subGroupMap = <String, dynamic>{};
      for (MapEntry<String, dynamic> entry in groupMap[subGroup].entries)
        subGroupMap[entry.key] = entry.value;

      return subGroupMap;
    } catch (e) {
      TGLog.e("Unable to load " + group + " from file " + yamlFile);
      TGLog.e(e.toString());
    }
    return <String, dynamic>{};
  }
}
