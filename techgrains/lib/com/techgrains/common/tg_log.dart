import 'package:techgrains/com/techgrains/common/tg_log_level.dart';

/// TGFramework's Logging implementation
class TGLog {
  /// Holds Log Level
  static TGLogLevel _logLevel = TGLogLevel.ALL;

  /// Gets Log Level
  static TGLogLevel geLogLevel() {
    return _logLevel;
  }

  /// Sets Log Level
  static void setLogLevel(TGLogLevel value) {
    _logLevel = value;
  }

  /// Tag Log
  static t(String tag, Object obj) {
    if (_logLevel.value >= TGLogLevel.TAG.value) _print(tag, obj);
  }

  /// Debug Log
  static d(Object debug) {
    if (_logLevel.value >= TGLogLevel.DEBUG.value) _print("DEBUG", debug);
  }

  /// Info Log
  static i(Object info) {
    if (_logLevel.value >= TGLogLevel.INFO.value) _print("INFO", info);
  }

  /// Warning Log
  static w(Object warn) {
    if (_logLevel.value >= TGLogLevel.WARN.value) _print("WARN", warn);
  }

  /// Error Log
  static e(Object error) {
    if (_logLevel.value >= TGLogLevel.ERROR.value) _print("ERROR", error);
  }

  /// Print with timestamp
  static _print(String tag, Object obj) {
    print(DateTime.now().toString() + "[" + tag + "] " + obj?.toString());
  }
}
