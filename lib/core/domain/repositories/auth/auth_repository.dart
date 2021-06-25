import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/auth/auth_entity.dart';

abstract class AuthRepository {
  Future<Resource<AuthEntity?>> signIn({
    required String email,
    required String password,
  });

  Future<Resource<String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
  });

  Future setDataAuthLocal(AuthEntity authEntity);

  Future<String?> get getToken;
}
