import 'package:radio_life/app/domain/entities/plans/plan_entity.dart';

class PlanEntityList {
  int? count;
  List<PlanEntity> items = [];

  PlanEntityList.fromJson(Map<String, dynamic> mapJson) {
    final plans = mapJson['planCreditGetAll'];
    count = 0;
    items = [];
    if (plans != null && plans.length > 0) {
      for (final objJson in plans) {
        items.add(PlanEntity.fromJson(objJson));
        count = count! + 1;
      }
    }
  }
}
