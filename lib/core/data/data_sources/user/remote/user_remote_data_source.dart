import 'package:graphql/client.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';

abstract class UserRemoteDataSource {
  Future<QueryResult> getUser({
    required String id,
  });

  Future<QueryResult> updateUserProfile({
    required UserEntity user,
  });
}
