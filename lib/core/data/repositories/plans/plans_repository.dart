import 'package:radio_life/core/data/data_sources/plans/remote/plans_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/plans/plan_entity_list.dart';

class PlansRepository {
  final _plansDataSource = PlansDataSource();

  @override
  Future<Resource<PlanEntityList?>> getPlans() => Resource.asFuture(
        () => _plansDataSource.getPlans(),
        (data) => PlanEntityList.fromJson(data),
      );

  @override
  Future<Resource<int>> signDevicePlan({
    required String deviceId,
    required String planId,
  }) =>
      Resource.asFuture(
        () => _plansDataSource.signDevicePlan(deviceId: deviceId, planId: planId),
        (data) => data ?? 0,
      );
}
