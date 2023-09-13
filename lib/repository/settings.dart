import 'package:hive/hive.dart';

class SettingsRepository {
  late Box _box;

  Future<SettingsRepository> init() async {
    if (Hive.isBoxOpen('settings')) {
      _box = Hive.box('settings');
    } else {
      _box = await Hive.openBox('settings');
    }
    return SettingsRepository._();
  }

  SettingsRepository._();

  Future<void> setDarkMode(bool darkMode) async {
    await _box.put('darkMode', darkMode);
  }

  Future<bool> getDarkMode() async {
    return _box.get('darkMode');
  }

  Future<void> setNotificationEnabled(bool notificationEnabled) async {
    await _box.put('notificationEnabled', notificationEnabled);
  }

  Future<bool> getNotificationEnabled() async {
    return _box.get('notificationEnabled');
  }
}
