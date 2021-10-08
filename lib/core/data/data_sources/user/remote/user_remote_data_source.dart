import 'package:graphql/client.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';
import 'package:radio_life/core/domain/entities/user/user_entity_password.dart';

abstract class UserRemoteDataSource {
  Future<QueryResult> getUser({
    required String id,
  });

  Future<QueryResult> updateUserProfile({
    required UserEntity user,
  });

  Future<QueryResult> updateUserPassword({
    required UserEntityPassword user,
  });
}
