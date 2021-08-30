import 'package:graphql/client.dart';

abstract class AuthRemoteDataSource {
  Future<QueryResult> signIn({
    required String email,
    required String password,
  });

  Future<QueryResult> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<QueryResult> resetPassword({
    required String email,
  });

  Future<QueryResult> signUp({
    required String firstName,
    required String lastName,
    required String email,
  });
}
