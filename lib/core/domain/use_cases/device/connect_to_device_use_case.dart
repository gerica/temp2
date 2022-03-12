import 'dart:async';

import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class ConnectToDeviceUseCase extends BaseSimpleUseCase {
  final DeviceRepository _deviceRepository;

  ConnectToDeviceUseCase(this._deviceRepository);

  @override
  Future<Resource<bool>> call(dynamic params) => _deviceRepository.connectToDevice(params);
}
