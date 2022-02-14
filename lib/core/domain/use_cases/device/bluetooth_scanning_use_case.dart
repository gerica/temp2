import 'dart:async';

import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class BluetoothScanningUseCase extends BaseSimpleUseCase {
  final DeviceRepository _deviceRepository;

  BluetoothScanningUseCase(this._deviceRepository);

  @override
  Stream<Resource<bool>> call(dynamic params) => _deviceRepository.isScanning;
}
