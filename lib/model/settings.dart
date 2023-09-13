// ignore_for_file: unnecessary_getters_setters

class Settings {
  bool _isNotificationEnabled;
  bool _isDarkMode;

  Settings(this._isNotificationEnabled, this._isDarkMode);
  Settings.empty()
      : _isNotificationEnabled = false,
        _isDarkMode = false;

  bool get isNotificationEnabled => _isNotificationEnabled;
  bool get isDarkMode => _isDarkMode;

  set isNotificationEnabled(bool value) {
    _isNotificationEnabled = value;
  }

  set isDarkMode(bool value) {
    _isDarkMode = value;
  }
}
