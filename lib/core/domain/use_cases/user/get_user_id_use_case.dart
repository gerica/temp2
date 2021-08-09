import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/user/user_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class GetUserIdUseCase extends BaseFutureResourceUseCase<void, String> {
  final UserRepository _userRepository;

  GetUserIdUseCase(this._userRepository);

  @override
  Future<Resource<String>> call([void params]) => _userRepository.getUserId();
}
