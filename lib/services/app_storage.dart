import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  Future<void> setNameProfile(String name) async {
    await _setString(StorageKeys.nameProfileKey, name);
  }

  Future<String?> getNameProfile() async {
    return await _getString(StorageKeys.nameProfileKey);
  }

  Future<void> setBirthdayProfile(String birthday) async {
    await _setString(StorageKeys.birthdayProfileKey, birthday);
  }

  Future<String?> getBirthdayProfile() async {
    return await _getString(StorageKeys.birthdayProfileKey);
  }

  Future<void> setExperienceProfile(String experience) async {
    await _setString(StorageKeys.experienceProfileKey, experience);
  }

  Future<String?> getExperienceProfile() async {
    return await _getString(StorageKeys.experienceProfileKey);
  }

  Future<void> setTechnologiesProfile(List<String> technologies) async {
    await _setList(StorageKeys.technologiesProfileKey, technologies);
  }

  Future<List<String>?> getTechnologiesProfile() async {
    return await _getStringList(StorageKeys.technologiesProfileKey);
  }

  Future<void> _setString(StorageKeys key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key.toString(), value);
  }

  Future<String?> _getString(StorageKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.toString());
  }

  Future<List<String>> _setList(StorageKeys key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key.toString(), value);
    return value;
  }

  Future<List<String>?> _getStringList(StorageKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key.toString());
  }
}

enum StorageKeys {
  nameProfileKey,
  birthdayProfileKey,
  experienceProfileKey,
  technologiesProfileKey,
}
