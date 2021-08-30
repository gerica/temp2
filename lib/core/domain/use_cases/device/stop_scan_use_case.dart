import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class StopBluetoothScanUseCase extends BaseSimpleUseCase {
  final DeviceRepository _deviceRepository;

  StopBluetoothScanUseCase(this._deviceRepository);

  @override
  Future call(dynamic params) => _deviceRepository.stopBluetoothScan;
}
