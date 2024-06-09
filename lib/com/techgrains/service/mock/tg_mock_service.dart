import 'dart:async';

import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/service/mock/tg_mock_mapping_vo.dart';
import 'package:techgrains/com/techgrains/service/request/tg_request.dart';
import 'package:techgrains/com/techgrains/util/tg_file_util.dart';

class TGMockService {
  static late Map<String, TGMockMappingVO> _mockMappings;
  static bool applyMock = false;

  static Future<void> loadMockMappings(String mockMappingsFile) async {
    TGLog.d("TGMockService.loadMockMappings()");
    TGLog.d("Loading... " + mockMappingsFile);
    _mockMappings = {};

    if (mockMappingsFile.isNotEmpty) {
      List jsonList = await TGFileUtil.readJsonFileAsList(mockMappingsFile);
      List<TGMockMappingVO> mappingList = jsonList
          .map<TGMockMappingVO>((json) => TGMockMappingVO.fromJson(json))
          .toList();

      _mockMappings = {};
      for (TGMockMappingVO mockMappingVO in mappingList) {
        await _saveMockMapping(mockMappingVO);
      }
    }
  }

  static Future _saveMockMapping(TGMockMappingVO mockMappingVO) async {
    if (mockMappingVO.applyMock == null && !mockMappingVO.applyMock!) return;

    mockMappingVO.successString = "";
    mockMappingVO.errorString = "";
    if (mockMappingVO.successFile != null) {
      mockMappingVO.successString =
          await TGFileUtil.readFile(mockMappingVO.successFile!);
    }
    if (mockMappingVO.errorFile != null) {
      mockMappingVO.errorString =
          await TGFileUtil.readFile(mockMappingVO.errorFile!);
    }
    _mockMappings[_generateHash(
        TGRequest.prepareUrl(TGRequest.defaultBaseUrl, mockMappingVO.uri),
        mockMappingVO.method!)] = mockMappingVO;
  }

  static TGMockMappingVO? getMockMappingVO(String url, String method) {
    String hash = _generateHash(url, method);
    return _mockMappings[hash];
  }

  static bool? shouldApplyMock(String uri, String method) {
    if (!applyMock) return false;

    String hash = _generateHash(
        TGRequest.prepareUrl(TGRequest.defaultBaseUrl, uri), method);
    if (_mockMappings.containsKey(hash)) {
      TGMockMappingVO? mockMappingVO = _mockMappings[hash];
      if (mockMappingVO != null) return mockMappingVO.applyMock;
    }

    // Unable to find mock mapping entry
    return false;
  }

  static String _generateHash(String url, String method) {
    return _trimUrl(url) + "_" + method;
  }

  static String _trimUrl(String? url) {
    if (url == null) return "";
    if (url.contains("?")) url = url.substring(0, url.indexOf("?"));
    if (url.endsWith("/")) url = url.substring(0, url.lastIndexOf("/"));
    return url;
  }
}
