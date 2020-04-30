import 'package:flutter_test/flutter_test.dart';
import 'package:techgrains/com/techgrains/util/tg_validate.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  tearDown(() {});

  test('email', () async {
    expect(TGValidate.email("valid@email.com"), true);
    expect(TGValidate.email("a@b"), false);
    expect(TGValidate.email("a@b.c"), false);
    expect(TGValidate.email("aa@b.c"), false);
    expect(TGValidate.email("a@bb.c"), false);
  });

  test('alphabets', () async {
    expect(TGValidate.alphabets("abcPQRxyz"), true);
    expect(TGValidate.alphabets(""), false);
    expect(TGValidate.alphabets(" "), false);
    expect(TGValidate.alphabets("0"), false);
    expect(TGValidate.alphabets("a1b"), false);
  });

  test('numeric', () async {
    expect(TGValidate.numeric("1234567890"), true);
    expect(TGValidate.numeric(""), false);
    expect(TGValidate.numeric(" "), false);
    expect(TGValidate.numeric("a"), false);
    expect(TGValidate.numeric("abc"), false);
  });

  test('alphanumeric', () async {
    expect(TGValidate.alphanumeric("abc123"), true);
    expect(TGValidate.alphanumeric(""), false);
    expect(TGValidate.alphanumeric(" "), false);
    expect(TGValidate.alphanumeric("abc&123"), false);
  });
}
