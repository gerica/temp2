import 'package:injectable/injectable.dart';
import 'package:radio_life/core/domain/managers/user_manager.dart';
import 'package:radio_life/core/domain/repositories/auth/auth_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class LogOutUseCase extends BaseFutureUseCase{

  final AuthRepository _authRepository;
  final UserManager _userManager;

  LogOutUseCase(this._authRepository, this._userManager);

  @override
  Future call([dynamic params]){
    _userManager.setLoggedIn(isLoggedIn: false);
    return _authRepository.logout;
  }

}