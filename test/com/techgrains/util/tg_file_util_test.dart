import 'package:flutter_test/flutter_test.dart';
import 'package:techgrains/com/techgrains/util/tg_file_util.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  tearDown(() {});

  test('alphanumeric', () async {
    String content = await TGFileUtil.readFileAsString("assets/files/company.txt");
    expect(content, "Techgrains Technologies");
  });
}
