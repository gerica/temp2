import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';
import 'package:radio_life/core/domain/repositories/user/user_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class UpdateUserProfileUseCase
    extends BaseFutureResourceUseCase<UserEntity, void> {
  final UserRepository _userRepository;

  UpdateUserProfileUseCase(this._userRepository);

  @override
  Future<Resource<void>> call(UserEntity params) =>
      _userRepository.updateUserProfile(user: params);
}
