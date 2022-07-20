import 'package:graphql/client.dart';
import 'package:radio_life/app/data/data_sources/datasource_base.dart';
import 'package:radio_life/app/data/data_sources/plans/remote/add_credit_by_plan_mutation.dart';
import 'package:radio_life/app/data/data_sources/plans/remote/get_all_plans_query.dart';

class PlansDataSource extends DataSourceBase {
  PlansDataSource() : super();

  @override
  Future<QueryResult> getPlans() {
    final query = GetAllPlansQuery();
    return graphQLClient.query(
      QueryOptions(document: query.document),
    );
  }

  @override
  Future<QueryResult> signDevicePlan({
    required String deviceId,
    required String planId,
  }) {
    final mutation = AddCreditByPlanMutation(idPlan: planId, idDevice: deviceId);
    return graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }
}
