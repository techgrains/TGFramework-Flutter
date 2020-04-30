import 'package:intl/intl.dart';

class TGDateUtil {
  static const String _DATE_PATTERN = "yyyy-MM-dd";
  static const String _DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

  static String formatDate(DateTime dateTime, {String datePattern = _DATE_PATTERN}) {
    return DateFormat(datePattern).format(dateTime);
  }

  static String formatDateTime(DateTime dateTime, {String dateTimePattern = _DATE_TIME_PATTERN}) {
    return DateFormat(dateTimePattern).format(dateTime);
  }

  static DateTime parseDate(String dateTime, {String datePattern = _DATE_PATTERN}) {
    return DateFormat(datePattern).parse(dateTime);
  }

  static DateTime parseDateTime(String dateTime, {String dateTimePattern = _DATE_TIME_PATTERN}) {
    return DateFormat(dateTimePattern).parse(dateTime);
  }
}
