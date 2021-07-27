abstract class AuthLocalDataSource{
  Future<void> saveToken({required String token});
  Future<String?> get getToken;
  Future<void> saveEmail({required String email});
  Future<void> saveName({required String name});
  Future<void> saveUserConfirmedValue({required bool confirmed});
  Future<bool> get getUserConfirmedValue;
  Future<String?> get getEmail;
  Future deleteUser();
  Future get logout;
}