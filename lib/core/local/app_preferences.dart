import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  final _isFirstOpen = 'is-first-open';
  final _themeUser = 'theme-user';

  AppPreferences(this._sharedPreferences);

  bool get isFirstOpen => _sharedPreferences.getBool(_isFirstOpen) ?? true;

  Future setIsFirstOpenValue({required bool isFirstOpen}) =>
      _sharedPreferences.setBool(_isFirstOpen, isFirstOpen);

  Future deleteAll() async => _sharedPreferences.clear();

  Future setThemeUser({required bool? isDark}) {
    final String themeUser;
    switch (isDark) {
      case true:
        themeUser = 'true';
        break;

      case false:
        themeUser = 'false';
        break;

      default:
        themeUser = 'null';
        break;
    }
    return _sharedPreferences.setString(_themeUser, themeUser);
  }

  bool? get themeUserIsDark {
    final themeUser = _sharedPreferences.getString(_themeUser);
    bool? themeUserPrefs;
    switch (themeUser) {
      case 'true':
        themeUserPrefs = true;
        break;

      case 'false':
        themeUserPrefs = false;
        break;

      default:
        themeUserPrefs = null;
    }
    return themeUserPrefs;
  }
}
