import 'package:injectable/injectable.dart';
import 'package:radio_life/core/domain/repositories/user/user_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class SaveUserIdUseCase extends BaseSimpleUseCase<String, void> {
  final UserRepository _userRepository;

  SaveUserIdUseCase(this._userRepository);

  @override
  Future<void> call(String params) => _userRepository.saveUserId(id: params);
}
