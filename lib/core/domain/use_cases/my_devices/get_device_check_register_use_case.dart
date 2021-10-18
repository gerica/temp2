import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/device/device_check_register.dart';
import 'package:radio_life/core/domain/repositories/my_device/my_device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class GetDeviceCheckRegisterUseCase extends BaseFutureResourceUseCase<String, DeviceCheckRegister> {
  final MyDeviceRepository _repository;

  GetDeviceCheckRegisterUseCase(this._repository);

  @override
  Future<Resource<DeviceCheckRegister>> call(String params) => _repository.getDeviceCheckRegister(serialNumber: params);
}
