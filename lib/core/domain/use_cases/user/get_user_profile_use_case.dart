import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';
import 'package:radio_life/core/domain/repositories/user/user_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class GetUserProfileUseCase
    extends BaseFutureResourceUseCase<String, UserEntity> {
  final UserRepository _userRepository;

  GetUserProfileUseCase(this._userRepository);

  @override
  Future<Resource<UserEntity?>> call(String params) =>
      _userRepository.getUser(id: params);
}
