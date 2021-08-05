import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/auth/local/auth_local_data_source.dart';
import 'package:radio_life/core/data/data_sources/auth/remote/auth_remote_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/auth/auth_entity.dart';
import 'package:radio_life/core/domain/repositories/auth/auth_repository.dart';

import '../../../../graphql/graphql_api.dart';
import '../../adapter/auth/auth_entensions.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImplementation extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImplementation(
      this._remoteDataSource, this._authLocalDataSource);

  @override
  Future<Resource<AuthEntity?>> signIn({
    required String email,
    required String password,
  }) =>
      Resource.asFuture(
        () => _remoteDataSource.signIn(email: email, password: password),
        (data) => SignIn$Mutation.fromJson(data).userLogin?.toAuthEntity(),
      );

  @override
  Future<Resource<String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
  }) =>
      Resource.asFuture(
          () => _remoteDataSource.signUp(
                firstName: firstName,
                lastName: lastName,
                email: email,
              ),
          (data) => SignUp$Mutation.fromJson(data).userRegister ?? '');

  @override
  Future setDataAuthLocal(AuthEntity authEntity) async {
    final token = authEntity.token;
    if (token != null) await _authLocalDataSource.saveToken(token: token);
    final email = authEntity.email;
    if (email != null) await _authLocalDataSource.saveEmail(email: email);
  }

  @override
  Future<String?> get getToken => _authLocalDataSource.getToken;

  @override
  Future get logout => _authLocalDataSource.logout;

  @override
  Future<bool> get getUserConfirmedValue =>
      _authLocalDataSource.getUserConfirmedValue;

  @override
  Future<void> saveUserConfirmedValue({required bool confirmed}) =>
      _authLocalDataSource.saveUserConfirmedValue(confirmed: confirmed);

  @override
  Future<Resource<AuthEntity?>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) =>
      Resource.asFuture(
        () => _remoteDataSource.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        ),
        (data) => ChangePassword$Mutation.fromJson(data)
            .userChangePassword
            ?.toAuthEntity(),
      );

  @override
  String? get getTokenFromLocalStorage =>
      _authLocalDataSource.getTokenFromLocalStorage;

  @override
  Future<void> saveTokenAtLocalStorage({required String token}) =>
      _authLocalDataSource.saveTokenAtLocalStorage(token: token);
}
