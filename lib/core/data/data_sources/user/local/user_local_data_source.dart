abstract class UserLocalDataSource {
  String get getUserId;

  Future<void> saveUserId(String id);
}
