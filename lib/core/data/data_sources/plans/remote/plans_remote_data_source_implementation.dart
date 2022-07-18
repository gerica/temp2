import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/plans/remote/add_credit_by_plan_mutation.dart';
import 'package:radio_life/core/data/data_sources/plans/remote/get_all_plans_query.dart';
import 'package:radio_life/core/data/data_sources/plans/remote/plans_remote_data_source.dart';

@Injectable(as: PlansRemoteDataSource)
class PlansRemoteDataSourceImplementation extends PlansRemoteDataSource {
  final GraphQLClient _graphQLClient;

  PlansRemoteDataSourceImplementation(this._graphQLClient);

  @override
  Future<QueryResult> getPlans() {
    final query = GetAllPlansQuery();
    return _graphQLClient.query(
      QueryOptions(document: query.document),
    );
  }

  @override
  Future<QueryResult> signDevicePlan({
    required String deviceId,
    required String planId,
  }) {
    final mutation = AddCreditByPlanMutation(idPlan: planId, idDevice: deviceId);
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }
}
