class TGMockMappingVO {
  String? uri;
  final String? method;
  final bool? applyMock;
  final int? httpStatus;
  final String? successFile;
  final String? errorFile;

  late String successString;
  late String errorString;

  TGMockMappingVO(
      {this.uri,
      this.method,
      this.applyMock,
      this.httpStatus,
      this.successFile,
      this.errorFile});

  TGMockMappingVO.fromJson(Map<String, dynamic> json)
      : uri = json['uri'],
        method = json['method'],
        applyMock = json['applyMock'],
        httpStatus = json['httpStatus'],
        successFile = json['successFile'],
        errorFile = json['errorFile'];
}
