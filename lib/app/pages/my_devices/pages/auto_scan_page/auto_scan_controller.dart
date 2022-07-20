import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/data/model/app_exception.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/data/repositories/my_device/device_repository.dart';
import 'package:radio_life/app/pages/base_controller.dart';
import 'package:radio_life/app/pages/my_devices/model/add_new_device_model.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';

class AutoScanController extends BaseController {
  final _deviceRepository = DeviceRepository();

  //endregion

  //region State
  static const initDevice = 99999;
  final state = Resource.loading<List<BluetoothDevice>?>().obs;
  final bluetoothState = BluetoothState.unknown.obs;
  final indexDevice = initDevice.obs;

  //endregion

  //region Variables
  late StreamSubscription _bluetoothStateStreamSubscription;
  final isScanning = false.obs;
  final serialNumber = ''.obs;

  //endregion

  //region Functions

  @override
  void onReady() {
    super.onReady();
    final param = tryCast<String>(Get.arguments);

    if (param != null) {
      serialNumber(param);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _bluetoothStateStreamSubscription = _deviceRepository.checkBluetoothState.listen(bluetoothStateListener);
    // _scanDeviceStreamSubscription = _deviceRepository.startBluetoothScan.listen(scanDeviceResultsListener);
    // startScan();
  }

  void bluetoothStateListener(Resource<BluetoothState?> resource) {
    final data = resource.data;
    if (data != null) {
      bluetoothState.value = data;
      switch (data) {
        case BluetoothState.unknown:
          break;
        case BluetoothState.unavailable:
          break;
        case BluetoothState.unauthorized:
          break;
        case BluetoothState.turningOn:
          break;
        case BluetoothState.on:
          startScan();
          break;
        case BluetoothState.turningOff:
          _deviceRepository.stopBluetoothScan;
          break;
        case BluetoothState.off:
          break;
      }
    }
  }

  Future startScan() async {
    // await _deviceRepository.stopBluetoothScan;
    state.value = Resource.loading(data: []);
    final values = await _deviceRepository.bluetoothConnected;
    state.value = Resource.success(data: values);
    _deviceRepository.startBluetoothScan.listen(_scanDeviceResultsListener);
    _deviceRepository.isScanning.listen(_bluetoothScanningListener);
  }

  @override
  Future dispose() async {
    super.dispose();
    _bluetoothStateStreamSubscription.pause();
    await _deviceRepository.stopBluetoothScan;
  }

  Future<void> connectToDevice() async {
    final discoveryResult = state.value.data![indexDevice.value];

    AppUIBlock.blockUI(context: Get.context);
    final response = await _deviceRepository.connectToDevice(discoveryResult);
    AppUIBlock.unblock(context: Get.context);

    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        Get.toNamed(Routes.configureWiFi,
            arguments: AddNewDevice(
              device: discoveryResult,
              serialNumber: serialNumber.value,
            ));
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
  }

  void selectDevice(int indexSelected) {
    indexDevice(indexSelected);
  }

  void _scanDeviceResultsListener(Resource<dynamic> resource) {
    final data = state.value.data ?? [];
    final result = resource.data;
    if (result != null) {
      if (BluetoothDeviceType.unknown != result.device.type && result.device.name != '') {
        data.add(result.device);
        state.value = Resource.success(data: data);
      }
    }
  }

  void _bluetoothScanningListener(Resource<bool> resource) {
    isScanning(resource.data);
  }

  bool deviceSelected() {
    return indexDevice.value != initDevice;
  }
}
