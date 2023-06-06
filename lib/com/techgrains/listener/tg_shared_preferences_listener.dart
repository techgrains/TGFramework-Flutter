/// Listener of TGSharedPreferences
abstract class TGSharedPreferencesListener {
  /// When put key in TGSharedPreferences
  void keySet(String key);

  /// When key removed from TGSharedPreferences
  void keyRemove(String key);
}
