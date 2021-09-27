import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/plans/plan_entity.dart';

abstract class PlansRepository {
  Future<Resource<List<PlanEntity?>>> getPlans();

  Future<Resource<void>> signDevicePlan({
    required String deviceId,
    required String planId,
  });
}
