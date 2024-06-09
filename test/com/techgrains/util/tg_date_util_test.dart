import 'package:flutter_test/flutter_test.dart';
import 'package:techgrains/com/techgrains/util/tg_date_util.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  tearDown(() {});

  test('formatDate', () async {
    DateTime date = DateTime(2020, 05, 16);
    expect(TGDateUtil.formatDate(date), "2020-05-16");
  });

  test('formatDateTime', () async {
    DateTime dateTime = DateTime(2020, 05, 16, 12, 47, 52);
    expect(TGDateUtil.formatDateTime(dateTime), "2020-05-16 12:47:52");
  });

  test('formatDateCustom', () async {
    DateTime date = DateTime(2020, 05, 16);
    expect(
        TGDateUtil.formatDate(date, datePattern: "dd/MM/yyyy"), "16/05/2020");
  });

  test('formatDateTimeCustom', () async {
    DateTime dateTime = DateTime(2020, 05, 16, 12, 47, 52);
    expect(
        TGDateUtil.formatDateTime(dateTime,
            dateTimePattern: "dd/MM/yyyy HH:mm:ss"),
        "16/05/2020 12:47:52");
  });

  test('parseDate', () async {
    DateTime date = TGDateUtil.parseDate("2020-05-16");
    expect(date.year, 2020);
    expect(date.month, 5);
    expect(date.day, 16);
  });

  test('parseDateTime', () async {
    DateTime date = TGDateUtil.parseDateTime("2020-05-16 12:47:52");
    expect(date.year, 2020);
    expect(date.month, 5);
    expect(date.day, 16);
    expect(date.hour, 12);
    expect(date.minute, 47);
    expect(date.second, 52);
  });

  test('parseDateCustom', () async {
    DateTime date =
        TGDateUtil.parseDate("16/05/2020", datePattern: "dd/MM/yyyy");
    expect(date.year, 2020);
    expect(date.month, 5);
    expect(date.day, 16);
  });

  test('parseDateTimeCustom', () async {
    DateTime dateTime = TGDateUtil.parseDateTime("16/05/2020T12:47:52",
        dateTimePattern: "dd/MM/yyyyTHH:mm:ss");
    expect(dateTime.year, 2020);
    expect(dateTime.month, 5);
    expect(dateTime.day, 16);
    expect(dateTime.hour, 12);
    expect(dateTime.minute, 47);
    expect(dateTime.second, 52);
  });

  test('convertTimezoneWithDateTime', () async {
    DateTime dateTime = DateTime(2024, 06, 07, 19, 35, 00);
    DateTime convertedDateTime = TGDateUtil.convertTimezoneWithDateTime(
        dateTime, TGTimeZone.CST_CHINA, TGTimeZone.IST_INDIA);
    expect(convertedDateTime.year, 2024);
    expect(convertedDateTime.month, 6);
    expect(convertedDateTime.day, 7);
    expect(convertedDateTime.hour, 17);
    expect(convertedDateTime.minute, 05);
    expect(convertedDateTime.second, 00);
  });

  test('convertTimezoneWithString', () async {
    String convertedDateTime = TGDateUtil.convertTimezoneWithString(
        "2024-06-07 21:10:00", TGTimeZone.CST_CHINA, TGTimeZone.IST_INDIA);
    DateTime dateTimeParsed = DateTime.parse(convertedDateTime);
    expect(dateTimeParsed.year, 2024);
    expect(dateTimeParsed.month, 6);
    expect(dateTimeParsed.day, 7);
    expect(dateTimeParsed.hour, 18);
    expect(dateTimeParsed.minute, 40);
    expect(dateTimeParsed.second, 00);
  });
}
