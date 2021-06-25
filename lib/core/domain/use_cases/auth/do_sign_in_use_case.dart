import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/auth/auth_entity.dart';
import 'package:radio_life/core/domain/repositories/auth/auth_repository.dart';
import 'package:radio_life/core/domain/use_cases/auth/set_user_use_case.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class SignInParams {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});
}

class DoSignInUseCase extends BaseFutureResourceUseCase<SignInParams, AuthEntity> {
  final AuthRepository _authRepository;
  final SetUserUseCase _setUserUseCase;

  DoSignInUseCase(this._authRepository, this._setUserUseCase);

  @override
  Future<Resource<AuthEntity?>> call(SignInParams params) async {
    final response = await _authRepository.signIn(email: params.email, password: params.password);
    if (response.status == Status.success) {
      final authEntity = response.data;
      if (authEntity != null) await _setUserUseCase(authEntity);
    }
    return response;
  }
}
