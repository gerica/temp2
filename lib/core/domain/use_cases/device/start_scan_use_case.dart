import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class StartBluetoothScanUseCase extends BaseSimpleUseCase {
  final DeviceRepository _deviceRepository;

  StartBluetoothScanUseCase(this._deviceRepository);

  @override
  Stream<Resource<ScanResult>> call(dynamic params) => _deviceRepository.startBluetoothScan;
}
