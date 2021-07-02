import 'package:flutter_blue/flutter_blue.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class ScanBluetoothDevicesUseCase extends BaseStreamResourceUseCase<dynamic, List<ScanResult>> {
  final DeviceRepository _deviceRepository;

  ScanBluetoothDevicesUseCase(this._deviceRepository);

  @override
  Stream<Resource<List<ScanResult>?>> call(dynamic params) =>
      _deviceRepository.scanBluetoothDevices();
}
