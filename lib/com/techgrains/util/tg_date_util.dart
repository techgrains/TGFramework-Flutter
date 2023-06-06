import 'package:intl/intl.dart';

/// TGFramework's Date related implementation
class TGDateUtil {
  /// Default Date Pattern
  static const String _DATE_PATTERN = "yyyy-MM-dd";

  /// Default Date Time Pattern
  static const String _DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

  /// Formats Date
  static String formatDate(DateTime dateTime,
      {String datePattern = _DATE_PATTERN}) {
    return DateFormat(datePattern).format(dateTime);
  }

  /// Formats DateTime
  static String formatDateTime(DateTime dateTime,
      {String dateTimePattern = _DATE_TIME_PATTERN}) {
    return DateFormat(dateTimePattern).format(dateTime);
  }

  /// Parse Date
  static DateTime parseDate(String dateTime,
      {String datePattern = _DATE_PATTERN}) {
    return DateFormat(datePattern).parse(dateTime);
  }

  /// Parse DateTime
  static DateTime parseDateTime(String dateTime,
      {String dateTimePattern = _DATE_TIME_PATTERN}) {
    return DateFormat(dateTimePattern).parse(dateTime);
  }
}
