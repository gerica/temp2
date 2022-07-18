import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/plans/plan_entity_list.dart';

abstract class PlansRepository {
  Future<Resource<PlanEntityList?>> getPlans();

  Future<Resource<int>> signDevicePlan({
    required String deviceId,
    required String planId,
  });
}
