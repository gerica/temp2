import 'package:flutter_blue/flutter_blue.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class CheckBluetoothStateUseCase extends BaseStreamResourceUseCase<void, BluetoothState> {
  final DeviceRepository _deviceRepository;

  CheckBluetoothStateUseCase(this._deviceRepository);

  @override
  Stream<Resource<BluetoothState?>> call([void params]) => _deviceRepository.checkBluetoothState;
}
