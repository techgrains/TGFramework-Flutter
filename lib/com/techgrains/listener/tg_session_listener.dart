/// Listener of TGSession
abstract class TGSessionListener {
  /// When TGSession invalidated
  void invalidate();

  /// When put key in TGSession
  void keySet(String key);

  /// When key removed from TGSession
  void keyRemove(String key);
}
