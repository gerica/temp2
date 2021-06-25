// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../core/data/data_sources/local/auth_local_data_source.dart' as _i8;
import '../core/data/data_sources/local/auth_local_data_source_implementation.dart'
    as _i9;
import '../core/data/data_sources/remote/auth_remote_data_source.dart' as _i10;
import '../core/data/data_sources/remote/auth_remote_data_source_implementation.dart'
    as _i11;
import '../core/data/helpers/secure_local_storage.dart' as _i6;
import '../core/data/network/dio_client.dart' as _i15;
import '../core/data/repositories/auth/auth_reposity_implementation.dart'
    as _i13;
import '../core/domain/managers/user_manager.dart' as _i17;
import '../core/domain/managers/user_manager_implementation.dart' as _i18;
import '../core/domain/repositories/auth/auth_repository.dart' as _i12;
import '../core/domain/use_cases/auth/check_if_has_user_logged_in_use_case.dart'
    as _i14;
import '../core/domain/use_cases/auth/set_user_use_case.dart' as _i16;
import 'modules/device_module.dart' as _i21;
import 'modules/local_module.dart' as _i20;
import 'modules/remote_module.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> init(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final remoteModule = _$RemoteModule();
    final localModule = _$LocalModule();
    final deviceModule = _$DeviceModule();
    gh.factory<_i3.Dio>(() => remoteModule.provideDio());
    gh.lazySingleton<_i4.FlutterSecureStorage>(() => localModule.storage);
    gh.factory<_i5.HttpLink>(() => remoteModule.provideHttpLink());
    gh.factory<_i6.SecureLocalStorage>(
        () => _i6.SecureLocalStorage(get<_i4.FlutterSecureStorage>()));
    await gh.factoryAsync<_i7.SharedPreferences>(() => localModule.prefs,
        preResolve: true);
    gh.factory<String>(() => deviceModule.language, instanceName: 'language');
    gh.factory<_i5.WebSocketLink>(() => remoteModule.provideWebSocketLink());
    gh.factory<_i8.AuthLocalDataSource>(() =>
        _i9.AuthLocalDataSourceImplementation(get<_i6.SecureLocalStorage>()));
    await gh.factoryAsync<_i5.GraphQLClient>(
        () => remoteModule.provideGraphQLClient(get<_i5.HttpLink>(),
            get<_i5.WebSocketLink>(), get<_i6.SecureLocalStorage>()),
        preResolve: true);
    gh.factory<_i10.AuthRemoteDataSource>(
        () => _i11.AuthDataSourceImplementation(get<_i5.GraphQLClient>()));
    gh.factory<_i12.AuthRepository>(() => _i13.AuthRepositoryImplementation(
        get<_i10.AuthRemoteDataSource>(), get<_i8.AuthLocalDataSource>()));
    gh.factory<_i14.CheckIfUserIsLoggedInUseCase>(
        () => _i14.CheckIfUserIsLoggedInUseCase(get<_i12.AuthRepository>()));
    gh.factory<_i15.DioClient>(() => remoteModule.provideApi(
        get<_i3.Dio>(), get<_i3.InterceptorsWrapper>()));
    gh.factory<_i16.SetUserUseCase>(() => _i16.SetUserUseCase(
        get<_i12.AuthRepository>(), get<_i17.UserManager>()));
    gh.singleton<_i17.UserManager>(_i18.UserManagerImplementation());
    gh.singleton<_i3.InterceptorsWrapper>(remoteModule.provideInterceptor(
        get<_i3.Dio>(),
        get<String>(instanceName: 'language'),
        get<_i4.FlutterSecureStorage>()));
    return this;
  }
}

class _$RemoteModule extends _i19.RemoteModule {}

class _$LocalModule extends _i20.LocalModule {}

class _$DeviceModule extends _i21.DeviceModule {}
