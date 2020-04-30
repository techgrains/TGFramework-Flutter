import 'package:flutter_test/flutter_test.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  tearDown(() {});

  test('get', () async {
    expect(TGSession.getInstance().get("keyGet"), null);
  });

  test('set', () async {
    TGSession.getInstance().set("keySet", "value");
    expect(TGSession.getInstance().get("keySet"), "value");
  });

  test('remove', () async {
    TGSession.getInstance().set("keyRemove", "value");
    expect(TGSession.getInstance().get("keyRemove"), "value");
    TGSession.getInstance().remove("keyRemove");
    expect(TGSession.getInstance().get("keyRemove"),null);
  });
}
