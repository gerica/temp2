import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class DeviceConnectedUseCase extends BaseSimpleUseCase {
  final DeviceRepository _deviceRepository;

  DeviceConnectedUseCase(this._deviceRepository);

  @override
  Future<List<BluetoothDevice>> call(dynamic params) => _deviceRepository.bluetoothConnected;
}
