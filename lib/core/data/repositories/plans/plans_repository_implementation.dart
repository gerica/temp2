import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/plans/remote/plans_remote_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/plans/plan_entity.dart';
import 'package:radio_life/core/domain/repositories/plans/plans_repository.dart';
import 'package:radio_life/graphql/graphql_api.graphql.dart';

import '../../adapter/plans/get_plans_extension.dart';

@Injectable(as: PlansRepository)
class PlansRepositoryImplementation extends PlansRepository {
  final PlansRemoteDataSource _remoteDataSource;

  PlansRepositoryImplementation(this._remoteDataSource);

  @override
  Future<Resource<List<PlanEntity?>>> getPlans() => Resource.asFuture(
        () => _remoteDataSource.getPlans(),
        (data) => GetPlans$Query.fromJson(data).toEntityList,
      );

  @override
  Future<Resource<int>> signDevicePlan({
    required String deviceId,
    required String planId,
  }) =>
      Resource.asFuture(
        () => _remoteDataSource.signDevicePlan(
            deviceId: deviceId, planId: planId),
        (data) =>
            SignDevicePlan$Mutation.fromJson(data)
                .deviceAddCreditByPlan
                ?.balance ??
            0,
      );
}
