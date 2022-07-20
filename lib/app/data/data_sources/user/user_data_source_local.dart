import 'package:radio_life/app/data/helpers/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataSourceLocal {
  // late SecureLocalStorage _secureLocalStorage;
  late SharedPreferences _sharedPreferences;

  UserDataSourceLocal() {
    _init();
  }

  Future<void> _init() async {
    // _secureLocalStorage = SecureLocalStorage()
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  String get getUserId => _sharedPreferences.getString(StorageKeys.userId) ?? '';

  @override
  Future<void> saveUserId(String id) => _sharedPreferences.setString(StorageKeys.userId, id);
}
