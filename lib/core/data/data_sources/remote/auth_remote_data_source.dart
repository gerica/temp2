import 'package:graphql/client.dart';

abstract class AuthRemoteDataSource {
  Future<QueryResult> signIn({
    required String email,
    required String password,
  });

  Future<QueryResult> signUp({
    required String firstName,
    required String lastName,
    required String email,
  });
}
