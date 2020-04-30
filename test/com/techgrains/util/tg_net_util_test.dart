import 'package:flutter_test/flutter_test.dart';
import 'package:techgrains/com/techgrains/util/tg_net_util.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  tearDown(() {});

  test('isInternetAvailable', () async {
    expect(await TGNetUtil.isInternetAvailable(), true);
  });
}
