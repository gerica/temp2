import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/pages/auto_scan_page/auto_scan_controller.dart';
import 'package:radio_life/core/domain/use_cases/device/check_bluetooth_state_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/connect_to_device_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/start_scan_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/stop_scan_use_case.dart';
import 'package:radio_life/di/di.dart';

class AutoScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => StartBluetoothScanUseCase(getIt()));
    Get.create(() => StopBluetoothScanUseCase(getIt()));
    Get.create(() => CheckBluetoothStateUseCase(getIt()));
    Get.create(() => ConnectToDeviceUseCase(getIt()));
    Get.lazyPut(() => AutoScanController(
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
        ));
  }
}
