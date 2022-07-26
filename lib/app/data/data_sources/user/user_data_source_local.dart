import 'package:radio_life/app/data/helpers/storage_keys.dart';
import 'package:radio_life/app/helper/provider_access_data.dart';

class UserDataSourceLocal {
  @override
  String get getUserId => ProviderAccessData().sharedPreferences.getString(StorageKeys.userId) ?? '';

  @override
  Future<void> saveUserId(String id) => ProviderAccessData().sharedPreferences.setString(StorageKeys.userId, id);
}
