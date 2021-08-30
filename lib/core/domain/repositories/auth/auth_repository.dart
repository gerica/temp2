import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/auth/auth_entity.dart';

abstract class AuthRepository {
  Future<Resource<AuthEntity?>> signIn({
    required String email,
    required String password,
  });

  Future<Resource<AuthEntity?>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Resource<String?>> resetPassword({
    required String email,
  });

  Future<Resource<String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
  });

  Future setDataAuthLocal(AuthEntity authEntity);

  Future<void> saveUserConfirmedValue({required bool confirmed});

  Future<bool> get getUserConfirmedValue;

  Future get logout;

  Future<void> saveTokenAtLocalStorage({required String token});

  Future<String?> get getToken;

  String? get getTokenFromLocalStorage;
}
