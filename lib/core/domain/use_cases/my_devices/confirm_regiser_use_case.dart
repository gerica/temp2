import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';
import 'package:radio_life/core/domain/repositories/my_device/my_device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class ConfirmRegisterUseCase extends BaseFutureResourceUseCase<MyDeviceEntity, String> {
  final MyDeviceRepository _repository;

  ConfirmRegisterUseCase(this._repository);

  @override
  Future<Resource<String>> call(MyDeviceEntity params) => _repository.confirmRegister(entity: params);
}
