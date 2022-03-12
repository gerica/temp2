import 'package:flutter_blue/flutter_blue.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class ConfigureWifiParam {
  final BluetoothDevice device;
  final String ssid;
  final String password;

  ConfigureWifiParam({required this.device, required this.ssid, required this.password});
}

@injectable
class ConfigureWifiUseCase extends BaseUseCase {
  ConfigureWifiUseCase(this._deviceRepository);

  final DeviceRepository _deviceRepository;

  Future<Resource<String>> call(ConfigureWifiParam param) => _deviceRepository.configureWifi(param);
}
