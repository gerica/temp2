import 'package:graphql/client.dart';

abstract class PlansRemoteDataSource {
  Future<QueryResult> getPlans();

  Future<QueryResult> signDevicePlan({
    required String deviceId,
    required String planId,
  });
}
