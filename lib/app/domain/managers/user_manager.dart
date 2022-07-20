class UserManager {
  static final UserManager _singleton = UserManager._internal();

  factory UserManager() {
    return _singleton;
  }

  UserManager._internal();
  bool isLoggedIn = false;

  @override
  void setLoggedIn({required bool isLoggedIn}) {
    this.isLoggedIn = isLoggedIn;
  }
}
