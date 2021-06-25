import 'package:injectable/injectable.dart';
import 'package:radio_life/core/domain/managers/user_manager.dart';

@Singleton(as: UserManager)
class UserManagerImplementation extends UserManager {
  bool isLoggedIn = false;

  @override
  void setLoggedIn({required bool isLoggedIn}) {
    this.isLoggedIn = isLoggedIn;
  }
}
