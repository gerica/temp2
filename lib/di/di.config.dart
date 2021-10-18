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
    as _i30;
import '../core/data/data_sources/auth/remote/auth_remote_data_source_implementation.dart'
    as _i31;
import '../core/data/data_sources/exams/remote/exams_remote_data_source.dart'
    as _i38;
import '../core/data/data_sources/exams/remote/exams_remote_data_source_implementation.dart'
    as _i39;
import '../core/data/data_sources/my_device/remote/my_device_remote_data_source.dart'
    as _i17;
import '../core/data/data_sources/my_device/remote/my_device_remote_data_source_implementation.dart'
    as _i18;
import '../core/data/data_sources/plans/remote/plans_remote_data_source.dart'
    as _i21;
import '../core/data/data_sources/plans/remote/plans_remote_data_source_implementation.dart'
    as _i22;
import '../core/data/data_sources/user/local/user_local_data_source.dart'
    as _i11;
import '../core/data/data_sources/user/local/user_local_data_source_implementation.dart'
    as _i12;
import '../core/data/data_sources/user/remote/user_remote_data_source.dart'
    as _i26;
import '../core/data/data_sources/user/remote/user_remote_data_source_implementation.dart'
    as _i27;
import '../core/data/helpers/secure_local_storage.dart' as _i9;
import '../core/data/network/dio_client.dart' as _i37;
import '../core/data/repositories/auth/auth_reposity_implementation.dart'
    as _i33;
import '../core/data/repositories/exams/exams_repository_implementation.dart'
    as _i41;
import '../core/data/repositories/my_device/my_device_repository_implementation.dart'
    as _i20;
import '../core/data/repositories/plans/plans_repository_implementation.dart'
    as _i24;
import '../core/data/repositories/user/user_repository_implementation.dart'
    as _i29;
import '../core/device/repository/device_repository_implementation.dart'
    as _i57;
import '../core/domain/managers/user_manager.dart' as _i49;
import '../core/domain/managers/user_manager_implementation.dart' as _i56;
import '../core/domain/repositories/auth/auth_repository.dart' as _i32;
import '../core/domain/repositories/device/device_repository.dart' as _i16;
import '../core/domain/repositories/exams_repository.dart' as _i40;
import '../core/domain/repositories/my_device/my_device_repository.dart'
    as _i19;
import '../core/domain/repositories/plans/plans_repository.dart' as _i23;
import '../core/domain/repositories/plans/sign_device_plan_use_case.dart'
    as _i25;
import '../core/domain/repositories/user/user_repository.dart' as _i28;
import '../core/domain/use_cases/auth/change_password_use_case.dart' as _i55;
import '../core/domain/use_cases/auth/check_if_has_user_logged_in_use_case.dart'
    as _i35;
import '../core/domain/use_cases/auth/check_if_user_was_confirmed.dart' as _i36;
import '../core/domain/use_cases/auth/log_out_use_case.dart' as _i48;
import '../core/domain/use_cases/auth/reset_password_use_case.dart' as _i50;
import '../core/domain/use_cases/auth/set_user_use_case.dart' as _i52;
import '../core/domain/use_cases/device/check_connectivity_use_case.dart'
    as _i34;
import '../core/domain/use_cases/device/get_wifi_ssid_use_case.dart' as _i15;
import '../core/domain/use_cases/exams/get_exams_use_case.dart' as _i43;
import '../core/domain/use_cases/my_devices/get_device_check_register_use_case.dart'
    as _i42;
import '../core/domain/use_cases/my_devices/get_my_devices_use_case.dart'
    as _i44;
import '../core/domain/use_cases/plans/get_plans_use_case.dart' as _i45;
import '../core/domain/use_cases/user/get_user_id_use_case.dart' as _i46;
import '../core/domain/use_cases/user/get_user_profile_use_case.dart' as _i47;
import '../core/domain/use_cases/user/image_to_base64_use_case.dart' as _i8;
import '../core/domain/use_cases/user/save_user_id_use_case.dart' as _i51;
import '../core/domain/use_cases/user/update_user_password_use_case.dart'
    as _i53;
import '../core/domain/use_cases/user/update_user_profile_use_case.dart'
    as _i54;
import 'modules/device_module.dart' as _i59;
import 'modules/local_module.dart' as _i60;
import 'modules/remote_module.dart'
    as _i58; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i17.MyDeviceRemoteDataSource>(() =>
        _i18.MyDeviceRemoteDataSourceImplementation(get<_i6.GraphQLClient>()));
    gh.factory<_i19.MyDeviceRepository>(() =>
        _i20.MyDeviceRepositoryImplementation(
            get<_i17.MyDeviceRemoteDataSource>()));
    gh.factory<_i21.PlansRemoteDataSource>(() =>
        _i22.PlansRemoteDataSourceImplementation(get<_i6.GraphQLClient>()));
    gh.factory<_i23.PlansRepository>(() =>
        _i24.PlansRepositoryImplementation(get<_i21.PlansRemoteDataSource>()));
    gh.factory<_i25.SignDevicePlanUseCase>(
        () => _i25.SignDevicePlanUseCase(get<_i23.PlansRepository>()));
    gh.factory<_i26.UserRemoteDataSource>(() =>
        _i27.UserRemoteDataSourceImplementation(get<_i6.GraphQLClient>()));
    gh.factory<_i28.UserRepository>(() => _i29.UserRepositoryImplementation(
        get<_i26.UserRemoteDataSource>(), get<_i11.UserLocalDataSource>()));
    gh.factory<_i30.AuthRemoteDataSource>(
        () => _i31.AuthDataSourceImplementation(get<_i6.GraphQLClient>()));
    gh.factory<_i32.AuthRepository>(() => _i33.AuthRepositoryImplementation(
        get<_i30.AuthRemoteDataSource>(), get<_i13.AuthLocalDataSource>()));
    gh.factory<_i34.CheckConnectivityUseCase>(
        () => _i34.CheckConnectivityUseCase(get<_i16.DeviceRepository>()));
    gh.factory<_i35.CheckIfUserIsLoggedInUseCase>(
        () => _i35.CheckIfUserIsLoggedInUseCase(get<_i32.AuthRepository>()));
    gh.factory<_i36.CheckIfUserWasConfirmed>(
        () => _i36.CheckIfUserWasConfirmed(get<_i32.AuthRepository>()));
    gh.factory<_i37.DioClient>(() => remoteModule.provideApi(
        get<_i3.Dio>(), get<_i3.InterceptorsWrapper>()));
    gh.factory<_i38.ExamsRemoteDataSource>(() =>
        _i39.ExamsRemoteDataSourceImplementation(get<_i6.GraphQLClient>()));
    gh.factory<_i40.ExamsRepository>(() =>
        _i41.ExamsRepositoryImplementation(get<_i38.ExamsRemoteDataSource>()));
    gh.factory<_i42.GetDeviceCheckRegisterUseCase>(() =>
        _i42.GetDeviceCheckRegisterUseCase(get<_i19.MyDeviceRepository>()));
    gh.factory<_i43.GetExamsUseCase>(
        () => _i43.GetExamsUseCase(get<_i40.ExamsRepository>()));
    gh.factory<_i44.GetMyDevicesUseCase>(
        () => _i44.GetMyDevicesUseCase(get<_i19.MyDeviceRepository>()));
    gh.factory<_i45.GetPlansUseCase>(
        () => _i45.GetPlansUseCase(get<_i23.PlansRepository>()));
    gh.factory<_i46.GetUserIdUseCase>(
        () => _i46.GetUserIdUseCase(get<_i28.UserRepository>()));
    gh.factory<_i47.GetUserProfileUseCase>(
        () => _i47.GetUserProfileUseCase(get<_i28.UserRepository>()));
    gh.factory<_i48.LogOutUseCase>(() => _i48.LogOutUseCase(
        get<_i32.AuthRepository>(), get<_i49.UserManager>()));
    gh.factory<_i50.ResetPasswordUseCase>(
        () => _i50.ResetPasswordUseCase(get<_i32.AuthRepository>()));
    gh.factory<_i51.SaveUserIdUseCase>(
        () => _i51.SaveUserIdUseCase(get<_i28.UserRepository>()));
    gh.factory<_i52.SetUserUseCase>(() => _i52.SetUserUseCase(
        get<_i32.AuthRepository>(), get<_i49.UserManager>()));
    gh.factory<_i53.UpdateUserPasswordUseCase>(
        () => _i53.UpdateUserPasswordUseCase(get<_i28.UserRepository>()));
    gh.factory<_i54.UpdateUserProfileUseCase>(
        () => _i54.UpdateUserProfileUseCase(get<_i28.UserRepository>()));
    gh.factory<_i55.ChangePasswordUseCase>(() => _i55.ChangePasswordUseCase(
        get<_i32.AuthRepository>(), get<_i52.SetUserUseCase>()));
    gh.singleton<_i49.UserManager>(_i56.UserManagerImplementation());
    gh.singleton<_i16.DeviceRepository>(
        _i57.DeviceRepositoryImplementation(get<_i4.FlutterBlue>()));
    gh.singleton<_i3.InterceptorsWrapper>(remoteModule.provideInterceptor(
        get<_i3.Dio>(),
        get<String>(instanceName: 'language'),
        get<_i5.FlutterSecureStorage>()));
    return this;
  }
}

class _$RemoteModule extends _i58.RemoteModule {}

class _$DeviceModule extends _i59.DeviceModule {}

class _$LocalModule extends _i60.LocalModule {}
