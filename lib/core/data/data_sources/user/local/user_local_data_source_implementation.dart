import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/user/local/user_local_data_source.dart';
import 'package:radio_life/core/data/helpers/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: UserLocalDataSource)
class UserLocalDataSourceImplementation extends UserLocalDataSource {
  final SharedPreferences _sharedPreferences;

  UserLocalDataSourceImplementation(this._sharedPreferences);

  @override
  String get getUserId =>
      _sharedPreferences.getString(StorageKeys.userId) ?? '';

  @override
  Future<void> saveUserId(String id) =>
      _sharedPreferences.setString(StorageKeys.userId, id);
}
