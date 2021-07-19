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

import '../core/data/data_sources/local/auth_local_data_source.dart' as _i10;
import '../core/data/data_sources/local/auth_local_data_source_implementation.dart'
    as _i11;
import '../core/data/data_sources/remote/auth_remote_data_source.dart' as _i14;
import '../core/data/data_sources/remote/auth_remote_data_source_implementation.dart'
    as _i15;
import '../core/data/helpers/secure_local_storage.dart' as _i8;
import '../core/data/network/dio_client.dart' as _i20;
import '../core/data/repositories/auth/auth_reposity_implementation.dart'
    as _i17;
import '../core/device/repository/device_repository_implementation.dart'
    as _i24;
import '../core/domain/managers/user_manager.dart' as _i22;
import '../core/domain/managers/user_manager_implementation.dart' as _i23;
import '../core/domain/repositories/auth/auth_repository.dart' as _i16;
import '../core/domain/repositories/device/device_repository.dart' as _i13;
import '../core/domain/use_cases/auth/check_if_has_user_logged_in_use_case.dart'
    as _i19;
import '../core/domain/use_cases/auth/set_user_use_case.dart' as _i21;
import '../core/domain/use_cases/device/check_connectivity_use_case.dart'
    as _i18;
import '../core/domain/use_cases/device/get_wifi_ssid_use_case.dart' as _i12;
import 'modules/device_module.dart' as _i26;
import 'modules/local_module.dart' as _i27;
import 'modules/remote_module.dart'
    as _i25; // ignore_for_file: unnecessary_lambdas

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
        _i11.AuthLocalDataSourceImplementation(get<_i8.SecureLocalStorage>()));
    gh.factory<_i12.GetWiFiSSIDUseCase>(
        () => _i12.GetWiFiSSIDUseCase(get<_i13.DeviceRepository>()));
    await gh.factoryAsync<_i6.GraphQLClient>(
        () => remoteModule.provideGraphQLClient(get<_i6.HttpLink>(),
            get<_i6.WebSocketLink>(), get<_i8.SecureLocalStorage>()),
        preResolve: true);
    gh.factory<_i14.AuthRemoteDataSource>(
        () => _i15.AuthDataSourceImplementation(get<_i6.GraphQLClient>()));
    gh.factory<_i16.AuthRepository>(() => _i17.AuthRepositoryImplementation(
        get<_i14.AuthRemoteDataSource>(), get<_i10.AuthLocalDataSource>()));
    gh.factory<_i18.CheckConnectivityUseCase>(
        () => _i18.CheckConnectivityUseCase(get<_i13.DeviceRepository>()));
    gh.factory<_i19.CheckIfUserIsLoggedInUseCase>(
        () => _i19.CheckIfUserIsLoggedInUseCase(get<_i16.AuthRepository>()));
    gh.factory<_i20.DioClient>(() => remoteModule.provideApi(
        get<_i3.Dio>(), get<_i3.InterceptorsWrapper>()));
    gh.factory<_i21.SetUserUseCase>(() => _i21.SetUserUseCase(
        get<_i16.AuthRepository>(), get<_i22.UserManager>()));
    gh.singleton<_i22.UserManager>(_i23.UserManagerImplementation());
    gh.singleton<_i13.DeviceRepository>(
        _i24.DeviceRepositoryImplementation(get<_i4.FlutterBlue>()));
    gh.singleton<_i3.InterceptorsWrapper>(remoteModule.provideInterceptor(
        get<_i3.Dio>(),
        get<String>(instanceName: 'language'),
        get<_i5.FlutterSecureStorage>()));
    return this;
  }
}

class _$RemoteModule extends _i25.RemoteModule {}

class _$DeviceModule extends _i26.DeviceModule {}

class _$LocalModule extends _i27.LocalModule {}
