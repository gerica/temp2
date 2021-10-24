import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/my_device/my_device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class ConfirmRegisterUseCase extends BaseFutureResourceUseCase<String, String> {
  final MyDeviceRepository _repository;

  ConfirmRegisterUseCase(this._repository);

  @override
  Future<Resource<String>> call(String params) => _repository.confirmRegister(serialNumber: params);
}
