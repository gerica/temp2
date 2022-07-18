import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/plans/remote/plans_remote_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/plans/plan_entity_list.dart';
import 'package:radio_life/core/domain/repositories/plans/plans_repository.dart';

@Injectable(as: PlansRepository)
class PlansRepositoryImplementation extends PlansRepository {
  final PlansRemoteDataSource _remoteDataSource;

  PlansRepositoryImplementation(this._remoteDataSource);

  @override
  Future<Resource<PlanEntityList?>> getPlans() => Resource.asFuture(
        () => _remoteDataSource.getPlans(),
        (data) => PlanEntityList.fromJson(data),
      );

  @override
  Future<Resource<int>> signDevicePlan({
    required String deviceId,
    required String planId,
  }) =>
      Resource.asFuture(
        () => _remoteDataSource.signDevicePlan(deviceId: deviceId, planId: planId),
        (data) => data ?? 0,
      );
}
