import 'package:flutter_test/flutter_test.dart';
import 'package:techgrains/com/techgrains/util/tg_flavor.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TGFlavor.removeAllParams();
  });

  tearDown(() {});

  test('null', () async {
    TGFlavor.setParam("keyNull", null);
    expect(TGFlavor.param("keyNull"), null);
    expect(TGFlavor.param("someKey"), null);
  });

  test('bool', () async {
    TGFlavor.setParam("keyBool", true);
    expect(TGFlavor.param("keyBool"), true);
  });

  test('int', () async {
    TGFlavor.setParam("keyInt", 1);
    expect(TGFlavor.param("keyInt"), 1);
  });

  test('double', () async {
    TGFlavor.setParam("keyDouble", 2.0);
    expect(TGFlavor.param("keyDouble"), 2.0);
  });

  test('string', () async {
    TGFlavor.setParam("keyString", "String");
    expect(TGFlavor.param("keyString"), "String");
  });

  test('stringList', () async {
    List<String> list = ["A", "B", "C", "D"];
    TGFlavor.setParam("keyStringList", list);
    expect(TGFlavor.param("keyStringList"), list);
  });

  test('removeParam', () async {
    expect(TGFlavor.param("keyString"), null);
    TGFlavor.setParam("keyString", "String");
    expect(TGFlavor.param("keyString"), "String");
    TGFlavor.removeParam("keyString");
    expect(TGFlavor.param("keyString"), null);
  });

  test('removeAllParams', () async {
    expect(TGFlavor.param("keyString"), null);
    TGFlavor.setParam("keyString", "String");
    expect(TGFlavor.param("keyString"), "String");
    TGFlavor.removeAllParams();
    expect(TGFlavor.param("keyString"), null);
  });

}