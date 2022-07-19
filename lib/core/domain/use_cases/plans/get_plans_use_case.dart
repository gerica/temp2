import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/plans/plan_entity_list.dart';
import 'package:radio_life/core/domain/repositories/plans/plans_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class GetPlansUseCase extends BaseFutureResourceUseCase<void, PlanEntityList?> {
  final PlansRepository _plansRepository;

  GetPlansUseCase(this._plansRepository);

  @override
  Future<Resource<PlanEntityList?>> call([void params]) => _plansRepository.getPlans();
}
