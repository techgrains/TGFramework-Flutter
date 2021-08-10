import 'package:techgrains/com/techgrains/common/tg_log_level.dart';

class TGFlavorVO {
  final String? flavor;
  final String? baseUrl;
  final TGLogLevel? logLevel;
  final bool? applyMock;
  final String? mockMappingsFile;
  final Map<String, dynamic>? params;

  TGFlavorVO.fromJson(Map<String, dynamic> json)
      : flavor = json['flavor'],
        baseUrl = json['baseUrl'],
        logLevel = TGLogLevel.ALL.fromString(json['logLevel']),
        applyMock = (json['applyMock'] != null) ? json['applyMock'] : false,
        mockMappingsFile = json['mockMappingsFile'],
        params = json['params'];
}
