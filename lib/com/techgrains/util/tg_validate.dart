/// TGFramework's Validation related implementation
class TGValidate {
  /// Email RegEx Pattern
  static const String _EMAIL_PATTERN =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  /// Alphabets RegEx Pattern
  static const String _ALPHABETS_PATTERN = r'^[a-zA-Z]+$';

  /// Numeric RegEx Pattern
  static const String _NUMERIC_PATTERN = r'^-?[0-9]+$';

  /// Alphanumeric RegEx Pattern
  static const String _ALPHANUMERIC_PATTERN = r'^[a-zA-Z0-9]+$';

  /// Has Value
  static bool? hasValue(dynamic value) {
    if (value == null) return false;
    if (value is num) return value != 0;
    if (value is String || value is Iterable || value is Map) {
      return value.length > 0;
    }
    if (value is bool) return value;
    return true;
  }

  static String nullSafeString(String? value, {String? defaultValue}) {
    return value == null ? (defaultValue == null ? "" : defaultValue) : value;
  }

  /// Validate Email
  static bool email(String value) {
    return new RegExp(_EMAIL_PATTERN).hasMatch(value);
  }

  /// Validate Alphabets
  static bool alphabets(String value) {
    return new RegExp(_ALPHABETS_PATTERN).hasMatch(value);
  }

  /// Validate Numeric
  static bool numeric(String value) {
    return new RegExp(_NUMERIC_PATTERN).hasMatch(value);
  }

  /// Validate Alphanumeric
  static bool alphanumeric(String value) {
    return new RegExp(_ALPHANUMERIC_PATTERN).hasMatch(value);
  }
}
