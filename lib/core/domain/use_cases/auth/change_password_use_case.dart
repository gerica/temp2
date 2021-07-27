import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/auth/auth_entity.dart';
import 'package:radio_life/core/domain/repositories/auth/auth_repository.dart';
import 'package:radio_life/core/domain/use_cases/auth/set_user_use_case.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class ChangePasswordParams {
  final String currentPassword;
  final String newPassword;

  ChangePasswordParams({
    required this.currentPassword,
    required this.newPassword,
  });
}

@injectable
class ChangePasswordUseCase
    extends BaseFutureResourceUseCase<ChangePasswordParams, AuthEntity> {
  final AuthRepository _authRepository;
  final SetUserUseCase _setUserUseCase;

  ChangePasswordUseCase(this._authRepository, this._setUserUseCase);

  @override
  Future<Resource<AuthEntity?>> call(ChangePasswordParams params) async {
    final response = await _authRepository.changePassword(
      currentPassword: params.currentPassword,
      newPassword: params.newPassword,
    );
    if (response.status == Status.success) {
      final authEntity = response.data;
      if (authEntity != null) await _setUserUseCase(authEntity);
    }
    return response;
  }
}
