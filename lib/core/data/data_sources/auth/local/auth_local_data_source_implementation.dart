import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/helpers/secure_local_storage.dart';
import 'package:radio_life/core/data/helpers/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_local_data_source.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImplementation extends AuthLocalDataSource {
  final SecureLocalStorage _secureLocalStorage;
  final SharedPreferences _sharedPreferences;

  AuthLocalDataSourceImplementation(this._secureLocalStorage,
      this._sharedPreferences);

  @override
  Future deleteUser() {
    throw UnimplementedError();
  }

  @override
  Future<String?> get getEmail =>
      _secureLocalStorage.getData(key: StorageKeys.userEmail);

  @override
  Future<String?> get getToken =>
      _secureLocalStorage.getData(key: StorageKeys.token);

  @override
  Future<void> saveEmail({required String email}) =>
      _secureLocalStorage.saveData(key: StorageKeys.userEmail, value: email);

  @override
  Future<void> saveName({required String name}) =>
      _secureLocalStorage.saveData(key: StorageKeys.userName, value: name);

  @override
  Future<void> saveToken({required String token}) =>
      _secureLocalStorage.saveData(key: StorageKeys.token, value: token);

  @override
  Future get logout async {
    await _secureLocalStorage.clearData();
    await _sharedPreferences.clear();
  }

  @override
  Future<void> saveUserConfirmedValue({required bool confirmed}) =>
      _sharedPreferences.setBool(StorageKeys.userConfirmed, confirmed);

  @override
  Future<bool> get getUserConfirmedValue async =>
      _sharedPreferences.getBool(StorageKeys.userConfirmed) ?? false;

  @override
  String? get getTokenFromLocalStorage =>
      _sharedPreferences.getString(StorageKeys.token);

  @override
  Future<void> saveTokenAtLocalStorage({required String token}) =>
      _sharedPreferences.setString(StorageKeys.token, token);
}
