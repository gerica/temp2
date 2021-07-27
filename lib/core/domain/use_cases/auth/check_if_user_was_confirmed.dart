import 'package:injectable/injectable.dart';
import 'package:radio_life/core/domain/repositories/auth/auth_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class CheckIfUserWasConfirmed extends BaseFutureUseCase<void, bool> {
  final AuthRepository _authRepository;

  CheckIfUserWasConfirmed(this._authRepository);

  @override
  Future<bool> call([void params]) => _authRepository.getUserConfirmedValue;
}
