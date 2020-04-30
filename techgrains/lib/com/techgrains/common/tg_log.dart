import 'package:techgrains/com/techgrains/common/tg_log_level.dart';

class TGLog {
  static TGLogLevel _logLevel = TGLogLevel.ALL;

  static TGLogLevel geLogLevel() {
    return _logLevel;
  }

 static void setLogLevel(TGLogLevel value) {
    _logLevel = value;
  }

  static t(String tag, Object obj) {
    if (_logLevel.value >= TGLogLevel.TAG.value)
      _print(tag, obj);
  }

  static d(Object debug) {
    if (_logLevel.value >= TGLogLevel.DEBUG.value) _print("DEBUG", debug);
  }

  static i(Object info) {
    if (_logLevel.value >= TGLogLevel.INFO.value) _print("INFO", info);
  }

  static w(Object warn) {
    if (_logLevel.value >= TGLogLevel.WARN.value) _print("WARN", warn);
  }

  static e(Object error) {
    if (_logLevel.value >= TGLogLevel.ERROR.value) _print("ERROR", error);
  }

  static _print(String tag, Object obj) {
    print(DateTime.now().toString() + "[" + tag + "] " + obj?.toString());
  }
}
