import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/user/remote/user_remote_data_source.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';
import '../../../../../graphql/graphql_api.graphql.dart';

@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImplementation extends UserRemoteDataSource {
  final GraphQLClient _graphQLClient;

  UserRemoteDataSourceImplementation(this._graphQLClient);

  @override
  Future<QueryResult> getUser({required String id}) {
    final query = GetUserQuery(variables: GetUserArguments(id: id));
    return _graphQLClient.query(
      QueryOptions(
        document: query.document,
        variables: query.getVariablesMap(),
      ),
    );
  }

  @override
  Future<QueryResult> updateUserProfile({required UserEntity user}) {
    final mutation = UpdateUserMutation(
      variables: UpdateUserArguments(
          userId: user.id,
          firstName: user.firstName,
          lastName: user.lastName,
          image: user.image ?? ''),
    );
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.getVariablesMap(),
      ),
    );
  }
}
