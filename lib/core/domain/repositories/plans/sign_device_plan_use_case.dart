import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/plans/plans_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class SignDevicePlanParams {
  final String deviceId;
  final String planId;

  SignDevicePlanParams({
    required this.deviceId,
    required this.planId,
  });
}

@injectable
class SignDevicePlanUseCase
    extends BaseFutureResourceUseCase<SignDevicePlanParams, int> {
  final PlansRepository _plansRepository;

  SignDevicePlanUseCase(this._plansRepository);

  @override
  Future<Resource<int>> call(SignDevicePlanParams params) =>
      _plansRepository.signDevicePlan(
        deviceId: params.deviceId,
        planId: params.planId,
      );
}
