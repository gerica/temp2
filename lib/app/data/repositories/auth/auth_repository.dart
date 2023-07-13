import 'package:radio_life/app/data/data_sources/auth/auth_data_source.dart';
import 'package:radio_life/app/data/data_sources/auth/auth_data_source_local.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/domain/entities/auth/auth_entity.dart';

class AuthRepository {
  final _authDataSource = AuthDataSource();
  final _authDataSourceLocal = AuthDataSourceLocal();

  @override
  Future<Resource<AuthEntity?>> signIn({
    required String email,
    required String password,
  }) =>
      Resource.asFuture(
        () => _authDataSource.signIn(email: email, password: password),
        (data) => AuthEntity.fromJson(data),
      );

  @override
  Future<Resource<String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
  }) =>
      Resource.asFuture(
          () => _authDataSource.signUp(
                firstName: firstName,
                lastName: lastName,
                email: email,
              ), (data) {
        return data['userRegister'];
      });

  @override
  Future setDataAuthLocal(AuthEntity authEntity) async {
    final token = authEntity.token;
    if (token != null) await _authDataSourceLocal.saveToken(token: token);
    final email = authEntity.email;
    if (email != null) await _authDataSourceLocal.saveEmail(email: email);
    final confirmed = authEntity.confirmed;
    if (confirmed != null) await _authDataSourceLocal.saveUserConfirmedValue(confirmed: confirmed);
  }

  @override
  Future<String?> get getToken => _authDataSourceLocal.getToken;

  @override
  Future get logout => _authDataSourceLocal.logout;

  @override
  Future<bool> get getUserConfirmedValue => _authDataSourceLocal.getUserConfirmedValue;

  @override
  Future<void> saveUserConfirmedValue({required bool confirmed}) =>
      _authDataSourceLocal.saveUserConfirmedValue(confirmed: confirmed);

  @override
  Future<Resource<AuthEntity?>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) =>
      Resource.asFuture(
        () => _authDataSource.changePassword(
          oldPassword: currentPassword,
          newPassword: newPassword,
        ),
        (data) => AuthEntity.fromJson(data),
      );

  @override
  String? get getTokenFromLocalStorage => _authDataSourceLocal.getTokenFromLocalStorage;

  @override
  Future<void> saveTokenAtLocalStorage({required String token}) =>
      _authDataSourceLocal.saveTokenAtLocalStorage(token: token);

  @override
  Future<Resource<String?>> resetPassword({required String email}) => Resource.asFuture(
        () => _authDataSource.resetPassword(
          email: email,
        ),
        (data) => data,
      );
}
