import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/local/auth_local_data_source.dart';
import 'package:radio_life/core/data/helpers/secure_local_storage.dart';
import 'package:radio_life/core/data/helpers/storage_keys.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImplementation extends AuthLocalDataSource {
  final SecureLocalStorage _secureLocalStorage;

  AuthLocalDataSourceImplementation(this._secureLocalStorage);

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
  Future get logout => _secureLocalStorage.clearData();
}
