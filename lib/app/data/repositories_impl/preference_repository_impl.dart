import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/preferences_repository.dart';

class PreferenceRepositoryImpl extends PreferenceRepository {
  PreferenceRepositoryImpl({
    required SharedPreferences preferences,
    required bool systemDarlMode,
  })  : _preferences = preferences,
        _systemDarlMode = systemDarlMode;
  final SharedPreferences _preferences;
  final bool _systemDarlMode;
  @override
  bool get darkMode =>
      _preferences.getBool(
        Preference.darkMode.name,
      ) ??
      _systemDarlMode;

  @override
  Future<void> setDarkMode(bool darkMode) =>
      _preferences.setBool(Preference.darkMode.name, darkMode);
}

enum Preference { darkMode }
