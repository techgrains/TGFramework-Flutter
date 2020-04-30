import 'package:flutter_test/flutter_test.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/common/tg_log_level.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  tearDown(() {});

  test('set', () async {
    expect(TGLog.geLogLevel(), TGLogLevel.ALL);
    TGLog.setLogLevel(TGLogLevel.DEBUG);
    expect(TGLog.geLogLevel(), TGLogLevel.DEBUG);
  });

  test('print', () async {
    TGLog.setLogLevel(TGLogLevel.ALL);
    TGLog.t("TAG", "tag log");
    TGLog.d("debug log");
    TGLog.i("info log");
    TGLog.w("warning log");
    TGLog.e("error log");
  });
}
