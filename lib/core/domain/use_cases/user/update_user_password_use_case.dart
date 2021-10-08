import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/user/user_entity_password.dart';
import 'package:radio_life/core/domain/repositories/user/user_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class UpdateUserPasswordUseCase extends BaseFutureResourceUseCase<UserEntityPassword, void> {
  final UserRepository _userRepository;

  UpdateUserPasswordUseCase(this._userRepository);

  @override
  Future<Resource<void>> call(UserEntityPassword params) => _userRepository.updateUserPassword(user: params);
}
