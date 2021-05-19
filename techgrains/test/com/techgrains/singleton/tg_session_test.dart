import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/listener/tg_session_listener.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  tearDown(() {});

  test('get', () async {
    expect(TGSession.getInstance()!.get("keyGet"), null);
  });

  test('set', () async {
    TGSession.getInstance()!.set("keySet", "value");
    expect(TGSession.getInstance()!.get("keySet"), "value");
  });

  test('remove', () async {
    TGSession.getInstance()!.set("keyRemove", "value");
    expect(TGSession.getInstance()!.get("keyRemove"), "value");
    TGSession.getInstance()!.remove("keyRemove");
    expect(TGSession.getInstance()!.get("keyRemove"), null);
  });

  test('invalidate', () async {
    TGSession.getInstance()!.set("key", "value");
    expect(TGSession.getInstance()!.get("key"), "value");
    TGSession.getInstance()!.invalidate();
    expect(TGSession.getInstance()!.get("key"), null);
  });

  test('listener', () async {
    TGSession.getInstance()!.addListener(TGSessionListenerForTest());
    TGSession.getInstance()!.set("key", "value");
    expect(TGSession.getInstance()!.get("key"), "value");
    TGSession.getInstance()!.remove("key");
    TGSession.getInstance()!.removeAllListeners();
  });

  test('timestamp', () async {
    TGLog.d("createdAt = " + TGSession.getInstance()!.createdAt().toString());
    TGLog.d("validSince = " + TGSession.getInstance()!.validSince().toString());
    sleep(Duration(seconds: 1));
    TGLog.d("validSince = " + TGSession.getInstance()!.validSince().toString());
  });
}

class TGSessionListenerForTest extends TGSessionListener {
  @override
  void invalidate() {
    TGLog.d("TGSessionListenerForTest.invalidate");
  }

  @override
  void keyRemove(String key) {
    TGLog.d("TGSessionListenerForTest.keyRemove - " + key);
  }

  @override
  void keySet(String key) {
    TGLog.d("TGSessionListenerForTest.keySet - " + key);
  }
}
