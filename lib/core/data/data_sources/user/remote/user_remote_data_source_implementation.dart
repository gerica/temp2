import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/user/remote/user_remote_data_source.dart';
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
}
