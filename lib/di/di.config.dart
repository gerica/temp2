// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:flutter_blue/flutter_blue.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i6;
import 'package:image_picker/image_picker.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../core/data/data_sources/auth/local/auth_local_data_source.dart'
    as _i13;
import '../core/data/data_sources/auth/local/auth_local_data_source_implementation.dart'
    as _i14;
import '../core/data/data_sources/auth/remote/auth_remote_data_source.dart'
    as _i21;
import '../core/data/data_sources/auth/remote/auth_remote_data_source_implementation.dart'
    as _i22;
import '../core/data/data_sources/user/local/user_local_data_source.dart'
    as _i11;
import '../core/data/data_sources/user/local/user_local_data_source_implementation.dart'
    as _i12;
import '../core/data/data_sources/user/remote/user_remote_data_source.dart'
    as _i17;
import '../core/data/data_sources/user/remote/user_remote_data_source_implementation.dart'
    as _i18;
import '../core/data/helpers/secure_local_storage.dart' as _i9;
import '../core/data/network/dio_client.dart' as _i28;
import '../core/data/repositories/auth/auth_reposity_implementation.dart'
    as _i24;
import '../core/data/repositories/user/user_repository_implementation.dart'
    as _i20;
import '../core/device/repository/device_repository_implementation.dart'
    as _i38;
import '../core/domain/managers/user_manager.dart' as _i32;
import '../core/domain/managers/user_manager_implementation.dart' as _i37;
import '../core/domain/repositories/auth/auth_repository.dart' as _i23;
import '../core/domain/repositories/device/device_repository.dart' as _i16;
import '../core/domain/repositories/user/user_repository.dart' as _i19;
import '../core/domain/use_cases/auth/change_password_use_case.dart' as _i36;
import '../core/domain/use_cases/auth/check_if_has_user_logged_in_use_case.dart'
    as _i26;
import '../core/domain/use_cases/auth/check_if_user_was_confirmed.dart' as _i27;
import '../core/domain/use_cases/auth/log_out_use_case.dart' as _i31;
import '../core/domain/use_cases/auth/set_user_use_case.dart' as _i34;
import '../core/domain/use_cases/device/check_connectivity_use_case.dart'
    as _i25;
import '../core/domain/use_cases/device/get_wifi_ssid_use_case.dart' as _i15;
import '../core/domain/use_cases/user/get_user_id_use_case.dart' as _i29;
import '../core/domain/use_cases/user/get_user_profile_use_case.dart' as _i30;
import '../core/domain/use_cases/user/image_to_base64_use_case.dart' as _i8;
import '../core/domain/use_cases/user/save_user_id_use_case.dart' as _i33;
import '../core/domain/use_cases/user/update_user_profile_use_case.dart'
    as _i35;
import 'modules/device_module.dart' as _i40;
import 'modules/local_module.dart' as _i41;
import 'modules/remote_module.dart'
    as _i39; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> init(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final remoteModule = _$RemoteModule();
    final deviceModule = _$DeviceModule();
    final localModule = _$LocalModule();
    gh.factory<_i3.Dio>(() => remoteModule.provideDio());
    gh.factory<_i4.FlutterBlue>(() => deviceModule.flutterBlue);
    gh.lazySingleton<_i5.FlutterSecureStorage>(() => localModule.storage);
    gh.factory<_i6.HttpLink>(() => remoteModule.provideHttpLink());
    gh.factory<_i7.ImagePicker>(() => deviceModule.picker);
    gh.factory<_i8.ImageToBase64UseCase>(() => _i8.ImageToBase64UseCase());
    gh.factory<_i9.SecureLocalStorage>(
        () => _i9.SecureLocalStorage(get<_i5.FlutterSecureStorage>()));
    await gh.factoryAsync<_i10.SharedPreferences>(() => localModule.prefs,
        preResolve: true);
    gh.factory<String>(() => deviceModule.language, instanceName: 'language');
    gh.factory<_i11.UserLocalDataSource>(() =>
        _i12.UserLocalDataSourceImplementation(get<_i10.SharedPreferences>()));
    gh.factory<_i6.WebSocketLink>(() => remoteModule.provideWebSocketLink());
    gh.factory<_i13.AuthLocalDataSource>(() =>
        _i14.AuthLocalDataSourceImplementation(
            get<_i9.SecureLocalStorage>(), get<_i10.SharedPreferences>()));
    gh.factory<_i15.GetWiFiSSIDUseCase>(
        () => _i15.GetWiFiSSIDUseCase(get<_i16.DeviceRepository>()));
    await gh.factoryAsync<_i6.GraphQLClient>(
        () => remoteModule.provideGraphQLClient(
            get<_i6.HttpLink>(),
            get<_i6.WebSocketLink>(),
            get<_i9.SecureLocalStorage>(),
            get<_i10.SharedPreferences>()),
        preResolve: true);
    gh.factory<_i17.UserRemoteDataSource>(() =>
        _i18.UserRemoteDataSourceImplementation(get<_i6.GraphQLClient>()));
    gh.factory<_i19.UserRepository>(() => _i20.UserRepositoryImplementation(
        get<_i17.UserRemoteDataSource>(), get<_i11.UserLocalDataSource>()));
    gh.factory<_i21.AuthRemoteDataSource>(
        () => _i22.AuthDataSourceImplementation(get<_i6.GraphQLClient>()));
    gh.factory<_i23.AuthRepository>(() => _i24.AuthRepositoryImplementation(
        get<_i21.AuthRemoteDataSource>(), get<_i13.AuthLocalDataSource>()));
    gh.factory<_i25.CheckConnectivityUseCase>(
        () => _i25.CheckConnectivityUseCase(get<_i16.DeviceRepository>()));
    gh.factory<_i26.CheckIfUserIsLoggedInUseCase>(
        () => _i26.CheckIfUserIsLoggedInUseCase(get<_i23.AuthRepository>()));
    gh.factory<_i27.CheckIfUserWasConfirmed>(
        () => _i27.CheckIfUserWasConfirmed(get<_i23.AuthRepository>()));
    gh.factory<_i28.DioClient>(() => remoteModule.provideApi(
        get<_i3.Dio>(), get<_i3.InterceptorsWrapper>()));
    gh.factory<_i29.GetUserIdUseCase>(
        () => _i29.GetUserIdUseCase(get<_i19.UserRepository>()));
    gh.factory<_i30.GetUserProfileUseCase>(
        () => _i30.GetUserProfileUseCase(get<_i19.UserRepository>()));
    gh.factory<_i31.LogOutUseCase>(() => _i31.LogOutUseCase(
        get<_i23.AuthRepository>(), get<_i32.UserManager>()));
    gh.factory<_i33.SaveUserIdUseCase>(
        () => _i33.SaveUserIdUseCase(get<_i19.UserRepository>()));
    gh.factory<_i34.SetUserUseCase>(() => _i34.SetUserUseCase(
        get<_i23.AuthRepository>(), get<_i32.UserManager>()));
    gh.factory<_i35.UpdateUserProfileUseCase>(
        () => _i35.UpdateUserProfileUseCase(get<_i19.UserRepository>()));
    gh.factory<_i36.ChangePasswordUseCase>(() => _i36.ChangePasswordUseCase(
        get<_i23.AuthRepository>(), get<_i34.SetUserUseCase>()));
    gh.singleton<_i32.UserManager>(_i37.UserManagerImplementation());
    gh.singleton<_i16.DeviceRepository>(
        _i38.DeviceRepositoryImplementation(get<_i4.FlutterBlue>()));
    gh.singleton<_i3.InterceptorsWrapper>(remoteModule.provideInterceptor(
        get<_i3.Dio>(),
        get<String>(instanceName: 'language'),
        get<_i5.FlutterSecureStorage>()));
    return this;
  }
}

class _$RemoteModule extends _i39.RemoteModule {}

class _$DeviceModule extends _i40.DeviceModule {}

class _$LocalModule extends _i41.LocalModule {}
