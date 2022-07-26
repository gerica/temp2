import 'package:flutter/foundation.dart';
import 'package:radio_life/app/data/helpers/secure_local_storage.dart';
import 'package:radio_life/app/data/helpers/storage_keys.dart';
import 'package:radio_life/app/helper/provider_access_data.dart';

class AuthDataSourceLocal {
  final _secureLocalStorage = SecureLocalStorage();

  @override
  Future deleteUser() {
    throw UnimplementedError();
  }

  @override
  Future<String?> get getEmail => _secureLocalStorage.getData(key: StorageKeys.userEmail);

  @override
  Future<String?> get getToken => _secureLocalStorage.getData(key: StorageKeys.token);

  @override
  Future<void> saveEmail({required String email}) =>
      _secureLocalStorage.saveData(key: StorageKeys.userEmail, value: email);

  @override
  Future<void> saveName({required String name}) => _secureLocalStorage.saveData(key: StorageKeys.userName, value: name);

  @override
  Future<void> saveToken({required String token}) => _secureLocalStorage.saveData(key: StorageKeys.token, value: token);

  @override
  Future get logout async {
    if (kIsWeb)
      await ProviderAccessData().sharedPreferences.clear();
    else {
      await _secureLocalStorage.clearData();
      await ProviderAccessData().sharedPreferences.clear();
    }
  }

  @override
  Future<void> saveUserConfirmedValue({required bool confirmed}) =>
      ProviderAccessData().sharedPreferences.setBool(StorageKeys.userConfirmed, confirmed);

  @override
  Future<bool> get getUserConfirmedValue async =>
      ProviderAccessData().sharedPreferences.getBool(StorageKeys.userConfirmed) ?? false;

  @override
  String? get getTokenFromLocalStorage => ProviderAccessData().sharedPreferences.getString(StorageKeys.token);

  @override
  Future<void> saveTokenAtLocalStorage({required String token}) =>
      ProviderAccessData().sharedPreferences.setString(StorageKeys.token, token);
}
