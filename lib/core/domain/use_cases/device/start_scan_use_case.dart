import 'dart:async';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class StartBluetoothScanUseCase extends BaseSimpleUseCase {
  final DeviceRepository _deviceRepository;

  StartBluetoothScanUseCase(this._deviceRepository);

  @override
  Stream<Resource<BluetoothDiscoveryResult>> call(dynamic params) => _deviceRepository.startBluetoothScan;
}
