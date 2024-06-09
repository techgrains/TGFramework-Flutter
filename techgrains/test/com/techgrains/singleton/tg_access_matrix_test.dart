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

  test('has on empty ', () {
    expect(TGAccessMatrix.getInstance().hasCreate("key1", roleIds: [1]), false);
  });

  test('CRUD check for 1 role', () {
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 1, true, true, false, false));
    TGAccessMatrix.getInstance().applyRoles([1]);
    expect(TGAccessMatrix.getInstance().hasRead("1"), true);
    expect(TGAccessMatrix.getInstance().hasUpdate("1"), true);
    expect(TGAccessMatrix.getInstance().hasDelete("1"), false);
    expect(TGAccessMatrix.getInstance().hasCreate("1"), false);

    TGAccessMatrix.getInstance().applyRoles([0]);
    expect(TGAccessMatrix.getInstance().hasRead("0"), false);
    expect(TGAccessMatrix.getInstance().hasUpdate("0"), false);
    expect(TGAccessMatrix.getInstance().hasDelete("0"), false);
    expect(TGAccessMatrix.getInstance().hasCreate("0"), false);
  });

  test('CRUD check for multiple roles', () {
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 1, true, true, false, false));
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 2, true, false, true, false));
    TGAccessMatrix.getInstance().applyRoles([1, 2]);
    expect(TGAccessMatrix.getInstance().hasRead("1"), true);
    expect(TGAccessMatrix.getInstance().hasUpdate("1"), true);
    expect(TGAccessMatrix.getInstance().hasDelete("1"), true);
    expect(TGAccessMatrix.getInstance().hasCreate("1"), false);
  });

  test('Default roles', () {
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 1, true, true, false, false));
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 2, true, false, true, false));
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 3, true, false, false, true));
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 4, true, false, false, false));
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 5, false, true, false, false));
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 6, false, false, true, false));
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 7, false, false, false, true));

    expect(TGAccessMatrix.getInstance().hasRead("1"), false);
    expect(TGAccessMatrix.getInstance().hasUpdate("1"), false);
    expect(TGAccessMatrix.getInstance().hasDelete("1"), false);
    expect(TGAccessMatrix.getInstance().hasCreate("1"), false);

    TGAccessMatrix.getInstance().applyRoles([4, 5, 6, 7]);
    expect(TGAccessMatrix.getInstance().hasRead("1"), true);
    expect(TGAccessMatrix.getInstance().hasUpdate("1"), true);
    expect(TGAccessMatrix.getInstance().hasDelete("1"), true);
    expect(TGAccessMatrix.getInstance().hasCreate("1"), true);

    TGAccessMatrix.getInstance().applyRoles([6, 7]);
    expect(TGAccessMatrix.getInstance().hasRead("1"), false);
    expect(TGAccessMatrix.getInstance().hasUpdate("1"), false);
    expect(TGAccessMatrix.getInstance().hasDelete("1"), true);
    expect(TGAccessMatrix.getInstance().hasCreate("1"), true);

    expect(TGAccessMatrix.getInstance().hasRead("1", roleIds: [1]), true);
    expect(TGAccessMatrix.getInstance().hasUpdate("1", roleIds: [1]), true);
    expect(TGAccessMatrix.getInstance().hasDelete("1", roleIds: [1]), false);
    expect(TGAccessMatrix.getInstance().hasCreate("1", roleIds: [1]), false);
  });

  test('remove', () {
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

  test('invalidate', () {
    expect(TGAccessMatrix.getInstance().size(), 0);
    TGAccessMatrix.getInstance()
        .add(createMatrix("1", 1, true, true, false, false));
    expect(TGAccessMatrix.getInstance().size(), 1);
    TGAccessMatrix.getInstance().invalidate();
    expect(TGAccessMatrix.getInstance().size(), 0);
  });

  test('timestamp', () {
    TGLog.d(
        "createdAt = " + TGAccessMatrix.getInstance().createdAt().toString());
    TGLog.d(
        "validSince = " + TGAccessMatrix.getInstance().validSince().toString());
    sleep(Duration(seconds: 1));
    TGLog.d(
        "validSince = " + TGAccessMatrix.getInstance().validSince().toString());
  });
}
