import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';

@injectable
class CheckConnectivityUseCase {

  final DeviceRepository _deviceRepository;

  CheckConnectivityUseCase(this._deviceRepository);

  Stream<ConnectivityResult> call() => _deviceRepository.checkConnectivity;

}