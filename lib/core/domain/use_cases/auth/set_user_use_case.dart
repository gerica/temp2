import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/domain/entities/auth/auth_entity.dart';
import 'package:radio_life/core/domain/managers/user_manager.dart';
import 'package:radio_life/core/domain/repositories/auth/auth_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class SetUserUseCase extends BaseSimpleUseCase<AuthEntity, void> {
  final AuthRepository _loginRepository;
  final UserManager _userManager;

  SetUserUseCase(
    this._loginRepository,
    this._userManager,
  );

  @override
  Future call(AuthEntity params) async {
    if (kIsWeb) {
      await _loginRepository.saveTokenAtLocalStorage(token: params.token ?? '');
      await _loginRepository.saveUserConfirmedValue(
          confirmed: params.confirmed ?? false);
    } else
      await _loginRepository.setDataAuthLocal(params);

    _userManager.setLoggedIn(
      isLoggedIn: params.token != null && params.confirmed == true,
    );

    return;
  }
}
