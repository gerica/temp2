import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/auth/auth_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class SignUpParams {
  final String firstName;
  final String lastName;
  final String email;

  const SignUpParams({
    required this.email,
    required this.firstName,
    required this.lastName,
  });
}

class DoSignUpUseCase extends BaseFutureResourceUseCase<SignUpParams, String> {
  final AuthRepository _authRepository;

  DoSignUpUseCase(this._authRepository);

  @override
  Future<Resource<String?>> call(SignUpParams params) => _authRepository.signUp(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
      );
}
