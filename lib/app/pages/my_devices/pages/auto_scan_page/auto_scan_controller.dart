import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/model/add_new_device_model.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/use_cases/device/bluetooth_scanning_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/check_bluetooth_state_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/connect_to_device_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/device_connected_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/start_scan_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/stop_scan_use_case.dart';

class AutoScanController extends GetxController {
  AutoScanController(
    // this._scanBluetoothDevicesUseCase,
    this._startBluetoothScanUseCase,
    this._stopBluetoothScanUseCase,
    this._checkBluetoothStateUseCase,
    this._connectToDeviceUseCase,
    this._bluetoothScanningUseCase,
    this._deviceConnectedUseCase,
  );

  //region Use Cases
  // final ScanBluetoothDevicesUseCase _scanBluetoothDevicesUseCase;
  final StartBluetoothScanUseCase _startBluetoothScanUseCase;
  final StopBluetoothScanUseCase _stopBluetoothScanUseCase;
  final CheckBluetoothStateUseCase _checkBluetoothStateUseCase;
  final ConnectToDeviceUseCase _connectToDeviceUseCase;
  final BluetoothScanningUseCase _bluetoothScanningUseCase;
  final DeviceConnectedUseCase _deviceConnectedUseCase;

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
    _bluetoothStateStreamSubscription = _checkBluetoothStateUseCase().listen(bluetoothStateListener);
    // _scanDeviceStreamSubscription = _scanBluetoothDevicesUseCase(dynamic).listen(scanDeviceResultsListener);
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
          _stopBluetoothScanUseCase(dynamic);
          break;
        case BluetoothState.off:
          break;
      }
    }
  }

  Future startScan() async {
    // await _stopBluetoothScanUseCase(dynamic);
    state.value = Resource.loading(data: []);
    final values = await _deviceConnectedUseCase.call(null);
    state.value = Resource.success(data: values);
    _startBluetoothScanUseCase(dynamic).listen(_scanDeviceResultsListener);
    _bluetoothScanningUseCase(dynamic).listen(_bluetoothScanningListener);
  }

  @override
  Future dispose() async {
    super.dispose();
    _bluetoothStateStreamSubscription.pause();
    await _stopBluetoothScanUseCase(dynamic);
  }

  Future<void> connectToDevice() async {
    final discoveryResult = state.value.data![indexDevice.value];
    AppUIBlock.blockUI(context: Get.context);

    final response = await _connectToDeviceUseCase(discoveryResult);
    AppUIBlock.unblock(context: Get.context);

    if (response) {
      Get.toNamed(Routes.configureWiFi,
          arguments: AddNewDevice(
            device: discoveryResult,
            serialNumber: serialNumber.value,
          ));
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
