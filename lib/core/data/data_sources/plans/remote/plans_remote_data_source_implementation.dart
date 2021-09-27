import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/plans/remote/plans_remote_data_source.dart';
import 'package:radio_life/graphql/graphql_api.graphql.dart';

@Injectable(as: PlansRemoteDataSource)
class PlansRemoteDataSourceImplementation extends PlansRemoteDataSource {
  final GraphQLClient _graphQLClient;

  PlansRemoteDataSourceImplementation(this._graphQLClient);

  @override
  Future<QueryResult> getPlans() {
    final query = GetPlansQuery();
    return _graphQLClient.query(
      QueryOptions(document: query.document),
    );
  }

  @override
  Future<QueryResult> signDevicePlan({
    required String deviceId,
    required String planId,
  }) {
    final mutation = SignDevicePlanMutation(
      variables: SignDevicePlanArguments(idPlan: planId, idDevice: deviceId),
    );
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.getVariablesMap(),
      ),
    );
  }
}
