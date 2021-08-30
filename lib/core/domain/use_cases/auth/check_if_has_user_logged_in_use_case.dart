import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/domain/repositories/auth/auth_repository.dart';

@injectable
class CheckIfUserIsLoggedInUseCase {
  final AuthRepository _authRepository;

  CheckIfUserIsLoggedInUseCase(this._authRepository);

  Future<bool> call([void params]) async {
    final token = kIsWeb
        ? _authRepository.getTokenFromLocalStorage
        : await _authRepository.getToken;
    return token != null && token.isNotEmpty;
  }
}
