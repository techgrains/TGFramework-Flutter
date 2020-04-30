class TGValidate {
  static const String _EMAIL_PATTERN = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String _ALPHABETS_PATTERN = r'^[a-zA-Z]+$';
  static const String _ALPHANUMERIC_PATTERN = r'^[a-zA-Z0-9]+$';
  static const String _NUMERIC_PATTERN = r'^-?[0-9]+$';

  static bool email(String value) {
    return new RegExp(_EMAIL_PATTERN).hasMatch(value);
  }

  static bool alphabets(String value) {
    return new RegExp(_ALPHABETS_PATTERN).hasMatch(value);
  }

  static bool numeric(String value) {
    return new RegExp(_NUMERIC_PATTERN).hasMatch(value);
  }

  static bool alphanumeric(String value) {
    return new RegExp(_ALPHANUMERIC_PATTERN).hasMatch(value);
  }
}
