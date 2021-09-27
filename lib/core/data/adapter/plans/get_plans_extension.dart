import 'package:flinq/flinq.dart';
import 'package:radio_life/core/domain/entities/plans/plan_entity.dart';
import 'package:radio_life/graphql/graphql_api.graphql.dart';

extension GetPlansQueryExtension on GetPlans$Query$PlanCredit {
  PlanEntity get toEntity => PlanEntity(
        id: $id,
        name: name,
        credit: credit,
        value: value,
      );
}

extension GetPlansQueryListExtension on GetPlans$Query {
  List<PlanEntity?> get toEntityList {
    final planList = planCreditGetAll;
    if (planList == null) return [];
    return planList.mapWhereList(
        (plan) => plan?.toEntity, (element) => element != null);
  }
}
