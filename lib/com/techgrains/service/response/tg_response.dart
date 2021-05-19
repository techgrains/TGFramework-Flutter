abstract class TGResponse {
  int? timestamp;
  late int httpStatus;
  int? contentLength;
  Map<String, String>? headers;
  String? body;

  bool hasError = false;
  dynamic error;

  TGResponse();

  bool validate() {
    // Validation based on standard HTTP Code
    // Informational (100–199)  : Do nothing in validation
    // Successful (200–299) : Do nothing in validation
    // Redirects (300–399) : Do nothing in validation
    // Client Errors (400–499) : Populate TGError
    // Server Errors (500–599) : Just notify server error. Body has response already
    if (httpStatus >= 400 && httpStatus < 499) this.hasError = true;
    if (httpStatus >= 500 && httpStatus < 599) this.hasError = true;
    return this.hasError;
  }

  fromJson(dynamic json);
}
