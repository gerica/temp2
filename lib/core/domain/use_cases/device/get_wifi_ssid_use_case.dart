import 'package:injectable/injectable.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';

@injectable
class GetWiFiSSIDUseCase {
  GetWiFiSSIDUseCase(this._deviceRepository);

  final DeviceRepository _deviceRepository;

  Future<String?> call() => _deviceRepository.getWifiSSID;
}
