import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techgrains/com/techgrains/singleton/tg_shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  tearDown(() {});

  test('null', () async {
    await TGSharedPreferences.getInstance().set("keyNull", null);
    expect(await TGSharedPreferences.getInstance().get("keyNull"), null);

    expect(await TGSharedPreferences.getInstance().get("someKey"), null);
  });

  test('bool', () async {
    await TGSharedPreferences.getInstance().set("keyBool", true);
    expect(await TGSharedPreferences.getInstance().get("keyBool"), true);
  });

  test('int', () async {
    await TGSharedPreferences.getInstance().set("keyInt", 1);
    expect(await TGSharedPreferences.getInstance().get("keyInt"), 1);
  });

  test('double', () async {
    await TGSharedPreferences.getInstance().set("keyDouble", 2.0);
    expect(await TGSharedPreferences.getInstance().get("keyDouble"), 2.0);
  });

  test('string', () async {
    await TGSharedPreferences.getInstance().set("keyString", "String");
    expect(await TGSharedPreferences.getInstance().get("keyString"), "String");
  });

  test('stringList', () async {
    List<String> list = ["A", "B", "C", "D"];
    await TGSharedPreferences.getInstance().set("keyStringList", list);
    expect(await TGSharedPreferences.getInstance().get("keyStringList"), list);
  });
}
