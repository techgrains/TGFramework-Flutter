enum TGLogLevel { ALL, TAG, DEBUG, INFO, WARN, ERROR, OFF }

/// TGFramework's Logging mechanism's extension
extension TGLogLevelExtension on TGLogLevel {
  /// Gets value of the TGLogLevel
  int get value {
    switch (this) {
      case TGLogLevel.ALL:
        return 10;
      case TGLogLevel.TAG:
        return 5;
      case TGLogLevel.DEBUG:
        return 4;
      case TGLogLevel.INFO:
        return 3;
      case TGLogLevel.WARN:
        return 2;
      case TGLogLevel.ERROR:
        return 1;
      case TGLogLevel.OFF:
        return 0;
      default:
        return 0;
    }
  }

  TGLogLevel fromString(String value) {
    return TGLogLevel.values.firstWhere(
        (logLevel) =>
            logLevel.toString().split('.')[1].toUpperCase() ==
            value.toUpperCase(),
        orElse: () => TGLogLevel.OFF);
  }
}
