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
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../core/data/data_sources/auth/local/auth_local_data_source.dart'
    as _i10;
import '../core/data/data_sources/auth/local/auth_local_data_source_implementation.dart'
    as _i11;
import '../core/data/data_sources/auth/remote/auth_remote_data_source.dart'
    as _i18;
import '../core/data/data_sources/auth/remote/auth_remote_data_source_implementation.dart'
    as _i19;
import '../core/data/data_sources/user/remote/user_remote_data_source.dart'
    as _i14;
import '../core/data/data_sources/user/remote/user_remote_data_source_implementation.dart'
    as _i15;
import '../core/data/helpers/secure_local_storage.dart' as _i8;
import '../core/data/network/dio_client.dart' as _i25;
import '../core/data/repositories/auth/auth_reposity_implementation.dart'
    as _i21;
import '../core/data/repositories/user/user_repository_implementation.dart'
    as _i17;
import '../core/device/repository/device_repository_implementation.dart'
    as _i31;
import '../core/domain/managers/user_manager.dart' as _i27;
import '../core/domain/managers/user_manager_implementation.dart' as _i30;
import '../core/domain/repositories/auth/auth_repository.dart' as _i20;
import '../core/domain/repositories/device/device_repository.dart' as _i13;
import '../core/domain/repositories/user/user_repository.dart' as _i16;
import '../core/domain/use_cases/auth/change_password_use_case.dart' as _i29;
import '../core/domain/use_cases/auth/check_if_has_user_logged_in_use_case.dart'
    as _i23;
import '../core/domain/use_cases/auth/check_if_user_was_confirmed.dart' as _i24;
import '../core/domain/use_cases/auth/log_out_use_case.dart' as _i26;
import '../core/domain/use_cases/auth/set_user_use_case.dart' as _i28;
import '../core/domain/use_cases/device/check_connectivity_use_case.dart'
    as _i22;
import '../core/domain/use_cases/device/get_wifi_ssid_use_case.dart' as _i12;
import 'modules/device_module.dart' as _i33;
import 'modules/local_module.dart' as _i34;
import 'modules/remote_module.dart'
    as _i32; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i8.SecureLocalStorage>(
        () => _i8.SecureLocalStorage(get<_i5.FlutterSecureStorage>()));
    await gh.factoryAsync<_i9.SharedPreferences>(() => localModule.prefs,
        preResolve: true);
    gh.factory<String>(() => deviceModule.language, instanceName: 'language');
    gh.factory<_i6.WebSocketLink>(() => remoteModule.provideWebSocketLink());
    gh.factory<_i10.AuthLocalDataSource>(() =>
        _i11.AuthLocalDataSourceImplementation(
            get<_i8.SecureLocalStorage>(), get<_i9.SharedPreferences>()));
    gh.factory<_i12.GetWiFiSSIDUseCase>(
        () => _i12.GetWiFiSSIDUseCase(get<_i13.DeviceRepository>()));
    await gh.factoryAsync<_i6.GraphQLClient>(
        () => remoteModule.provideGraphQLClient(
            get<_i6.HttpLink>(),
            get<_i6.WebSocketLink>(),
            get<_i8.SecureLocalStorage>(),
            get<_i9.SharedPreferences>()),
        preResolve: true);
    gh.factory<_i14.UserRemoteDataSource>(() =>
        _i15.UserRemoteDataSourceImplementation(get<_i6.GraphQLClient>()));
    gh.factory<_i16.UserRepository>(() =>
        _i17.UserRepositoryImplementation(get<_i14.UserRemoteDataSource>()));
    gh.factory<_i18.AuthRemoteDataSource>(
        () => _i19.AuthDataSourceImplementation(get<_i6.GraphQLClient>()));
    gh.factory<_i20.AuthRepository>(() => _i21.AuthRepositoryImplementation(
        get<_i18.AuthRemoteDataSource>(), get<_i10.AuthLocalDataSource>()));
    gh.factory<_i22.CheckConnectivityUseCase>(
        () => _i22.CheckConnectivityUseCase(get<_i13.DeviceRepository>()));
    gh.factory<_i23.CheckIfUserIsLoggedInUseCase>(
        () => _i23.CheckIfUserIsLoggedInUseCase(get<_i20.AuthRepository>()));
    gh.factory<_i24.CheckIfUserWasConfirmed>(
        () => _i24.CheckIfUserWasConfirmed(get<_i20.AuthRepository>()));
    gh.factory<_i25.DioClient>(() => remoteModule.provideApi(
        get<_i3.Dio>(), get<_i3.InterceptorsWrapper>()));
    gh.factory<_i26.LogOutUseCase>(() => _i26.LogOutUseCase(
        get<_i20.AuthRepository>(), get<_i27.UserManager>()));
    gh.factory<_i28.SetUserUseCase>(() => _i28.SetUserUseCase(
        get<_i20.AuthRepository>(), get<_i27.UserManager>()));
    gh.factory<_i29.ChangePasswordUseCase>(() => _i29.ChangePasswordUseCase(
        get<_i20.AuthRepository>(), get<_i28.SetUserUseCase>()));
    gh.singleton<_i27.UserManager>(_i30.UserManagerImplementation());
    gh.singleton<_i13.DeviceRepository>(
        _i31.DeviceRepositoryImplementation(get<_i4.FlutterBlue>()));
    gh.singleton<_i3.InterceptorsWrapper>(remoteModule.provideInterceptor(
        get<_i3.Dio>(),
        get<String>(instanceName: 'language'),
        get<_i5.FlutterSecureStorage>()));
    return this;
  }
}

class _$RemoteModule extends _i32.RemoteModule {}

class _$DeviceModule extends _i33.DeviceModule {}

class _$LocalModule extends _i34.LocalModule {}
