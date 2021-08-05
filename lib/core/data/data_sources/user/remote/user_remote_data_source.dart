import 'package:graphql/client.dart';

abstract class UserRemoteDataSource {
  Future<QueryResult> getUser({
    required String id,
  });
}
