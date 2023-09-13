import 'package:hive/hive.dart';
import 'package:todoapp/model/settings.dart';

class SettingsRepository {
  static late Box _box;

  static Future<SettingsRepository> init() async {
    if (Hive.isBoxOpen('settings')) {
      _box = Hive.box('settings');
    } else {
      _box = await Hive.openBox('settings');
    }
    return SettingsRepository._();
  }

  SettingsRepository._();

  void setSettings(Settings settings) {
    _box.put('settings', {
      'isNotificationEnabled': settings.isNotificationEnabled,
      'isDarkMode': settings.isDarkMode,
    });
  }

  Settings getSettings() {
    var settings = _box.get('settings');
    if (settings == null) {
      return Settings.empty();
    }
    return Settings(
      settings['isNotificationEnabled'],
      settings['isDarkMode'],
    );
  }
}
