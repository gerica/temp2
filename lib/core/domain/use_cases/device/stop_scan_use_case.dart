import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class StartBluetoothScanUseCase extends BaseSimpleUseCase {
  final DeviceRepository _deviceRepository;

  StartBluetoothScanUseCase(this._deviceRepository);

  @override
  Future call(dynamic params) => _deviceRepository.startScan;
}
