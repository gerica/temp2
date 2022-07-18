import 'package:radio_life/core/domain/entities/plans/plan_entity.dart';

class PlanEntityList {
  int? count;
  List<PlanEntity> items = [];

  PlanEntityList.fromJson(Map<String, dynamic> parsedJson) {
    count = parsedJson['count'] == null ? null : parsedJson['count'] as int;
    final exams = parsedJson['items'];
    items = [];
    if (exams != null && exams.length > 0) {
      for (final objJson in exams) {
        items.add(PlanEntity.fromJson(objJson));
      }
    }
  }
}
