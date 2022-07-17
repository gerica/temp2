import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/user/remote/update_user_password_mutation.dart';
import 'package:radio_life/core/data/data_sources/user/remote/user_by_id_query.dart';
import 'package:radio_life/core/data/data_sources/user/remote/user_remote_data_source.dart';
import 'package:radio_life/core/data/data_sources/user/remote/user_update_mutation.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';
import 'package:radio_life/core/domain/entities/user/user_entity_password.dart';

@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImplementation extends UserRemoteDataSource {
  final GraphQLClient _graphQLClient;

  UserRemoteDataSourceImplementation(this._graphQLClient);

  @override
  Future<QueryResult> getUser({required String id}) {
    final query = UserByIdQuery(id: id);
    return _graphQLClient.query(
      QueryOptions(
        document: query.document,
        variables: query.variables,
      ),
    );
  }

  @override
  Future<QueryResult> updateUserProfile({required UserEntity user}) {
    final mutation = UserUpdateMutation(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      image: user.image,
    );
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }

  @override
  Future<QueryResult> updateUserPassword({required UserEntityPassword user}) {
    final mutation = UpdateUserPasswordMutation(entity: user);
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }
}
