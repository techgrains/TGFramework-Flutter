import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/model/tg_access_matrix_vo.dart';
import 'package:techgrains/com/techgrains/singleton/tg_access_matrix.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  tearDown(() {
    TGAccessMatrix.getInstance().invalidate();
  });

  TGAccessMatrixVO createMatrix(String key, int roleId, bool read, bool update,
      bool delete, bool create) {
    return TGAccessMatrixVO(
        key: key,
        roleId: roleId,
        read: read,
        update: update,
        delete: delete,
        create: create);
  }

  test('has on empty ', () async {
    expect(TGAccessMatrix.getInstance().hasCreate("key1", [1]), false);
  });

  test('CRUD check for 1 role', () async {
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 1, true, true, false, false));
    expect(TGAccessMatrix.getInstance().hasRead("1", [1]), true);
    expect(TGAccessMatrix.getInstance().hasUpdate("1", [1]), true);
    expect(TGAccessMatrix.getInstance().hasDelete("1", [1]), false);
    expect(TGAccessMatrix.getInstance().hasCreate("1", [1]), false);

    expect(TGAccessMatrix.getInstance().hasRead("0", [0]), false);
    expect(TGAccessMatrix.getInstance().hasUpdate("0", [0]), false);
    expect(TGAccessMatrix.getInstance().hasDelete("0", [0]), false);
    expect(TGAccessMatrix.getInstance().hasCreate("0", [0]), false);
  });

  test('CRUD check for multiple roles', () async {
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 1, true, true, false, false));
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 2, true, false, true, false));
    expect(TGAccessMatrix.getInstance().hasRead("1", [1, 2]), true);
    expect(TGAccessMatrix.getInstance().hasUpdate("1", [1, 2]), true);
    expect(TGAccessMatrix.getInstance().hasDelete("1", [1, 2]), true);
    expect(TGAccessMatrix.getInstance().hasCreate("1", [1, 2]), false);
  });

  test('remove', () async {
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 1, true, true, false, false));
    expect(TGAccessMatrix.getInstance().size(), 1);
    TGAccessMatrix.getInstance().remove("1", 0);
    expect(TGAccessMatrix.getInstance().size(), 1);
    TGAccessMatrix.getInstance().remove("0", 1);
    expect(TGAccessMatrix.getInstance().size(), 1);
    TGAccessMatrix.getInstance().remove("1", 1);
    expect(TGAccessMatrix.getInstance().size(), 0);
  });

  test('invalidate', () async {
    expect(TGAccessMatrix.getInstance().size(), 0);
    TGAccessMatrix.getInstance().add(new TGAccessMatrixVO());
    expect(TGAccessMatrix.getInstance().size(), 1);
    TGAccessMatrix.getInstance().invalidate();
    expect(TGAccessMatrix.getInstance().size(), 0);
  });

  test('timestamp', () async {
    TGLog.d(
        "createdAt = " + TGAccessMatrix.getInstance().createdAt().toString());
    TGLog.d(
        "validSince = " + TGAccessMatrix.getInstance().validSince().toString());
    sleep(Duration(seconds: 1));
    TGLog.d(
        "validSince = " + TGAccessMatrix.getInstance().validSince().toString());
  });
}
