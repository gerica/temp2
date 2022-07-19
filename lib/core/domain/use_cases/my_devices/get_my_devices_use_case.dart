import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/device/device_entity_list.dart';
import 'package:radio_life/core/domain/repositories/my_device/my_device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class GetMyDevicesUseCase extends BaseFutureResourceUseCase<void, DeviceEntityList> {
  final MyDeviceRepository _myDeviceRepository;

  GetMyDevicesUseCase(this._myDeviceRepository);

  @override
  Future<Resource<DeviceEntityList?>> call([void params]) => _myDeviceRepository.getMyDevices();
}
