// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:fresh_dio/fresh_dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../core/data/remote/dio_client.dart' as _i5;
import 'modules/device_module.dart' as _i10;
import 'modules/local_module.dart' as _i9;
import 'modules/remote_module.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

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
    await gh.factoryAsync<_i4.SharedPreferences>(() => localModule.prefs,
        preResolve: true);
    gh.factory<String>(() => deviceModule.language, instanceName: 'language');
    gh.factory<_i5.DioClient>(() => remoteModule.provideApi(
        get<_i3.Dio>(), get<_i6.InterceptorsWrapper>()));
    gh.singleton<_i7.FlutterSecureStorage>(localModule.storage);
    gh.singleton<_i6.InterceptorsWrapper>(remoteModule.provideInterceptor(
        get<_i3.Dio>(),
        get<String>(instanceName: 'language'),
        get<_i7.FlutterSecureStorage>()));
    return this;
  }
}

class _$RemoteModule extends _i8.RemoteModule {}

class _$LocalModule extends _i9.LocalModule {}

class _$DeviceModule extends _i10.DeviceModule {}
