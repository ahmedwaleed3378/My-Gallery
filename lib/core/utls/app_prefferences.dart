import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_IS_LOGGED_IN = 'PREFS_KEY_IS_LOGGED_IN';
const String PREFS_KEY_ONBOARDONG_VIEWED = "PREFS_KEY_ONBOARDONG_VIEWED";
const String TOKEN = 'TOKEN';
const String NAME = 'NAME';
const String ID = 'ID';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  setUserToken(String token) async {
    _sharedPreferences.setString(TOKEN, token);
  }

  getUserToken() {
    return _sharedPreferences.getString(TOKEN) ?? "";
  }

  setUserName(String name) async {
    _sharedPreferences.setString(NAME, name);
  }

  getUserName() {
    return _sharedPreferences.getString(NAME) ?? "";
  }

  setUserId(int id) async {
    _sharedPreferences.setInt(ID, id);
  }

  getUserID() {
    return _sharedPreferences.getString(ID) ?? 0;
  }

  bool isUserLoggedIn() {
    return _sharedPreferences.getBool(PREFS_KEY_IS_LOGGED_IN) ?? false;
  }

  Future<void> setUserLoggedIn() async {
    await _sharedPreferences.setBool(PREFS_KEY_IS_LOGGED_IN, true);
  }

  Future<void> setOnBoardingViewed() async {
    await _sharedPreferences.setBool(PREFS_KEY_ONBOARDONG_VIEWED, true);
  }

  bool getOnBoardingViewed() {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDONG_VIEWED) ?? false;
  }

  Future<void> logout() async {
    await _sharedPreferences.remove(PREFS_KEY_IS_LOGGED_IN);
    await _sharedPreferences.remove(TOKEN);
    _sharedPreferences.clear();
  }
}
