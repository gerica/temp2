import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/use_cases/device/bluetooth_scanning_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/check_bluetooth_state_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/connect_to_device_use_case.dart';
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
  );

  //region Use Cases
  // final ScanBluetoothDevicesUseCase _scanBluetoothDevicesUseCase;
  final StartBluetoothScanUseCase _startBluetoothScanUseCase;
  final StopBluetoothScanUseCase _stopBluetoothScanUseCase;
  final CheckBluetoothStateUseCase _checkBluetoothStateUseCase;
  final ConnectToDeviceUseCase _connectToDeviceUseCase;
  final BluetoothScanningUseCase _bluetoothScanningUseCase;

  //endregion

  //region State
  final state = Resource.loading<List<ScanResult>?>().obs;
  final bluetoothState = BluetoothState.unknown.obs;

  //endregion

  //region Variables
  late StreamSubscription _bluetoothStateStreamSubscription;
  final isScanning = false.obs;

  //endregion

  //region Functions
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
    _startBluetoothScanUseCase(dynamic).listen(_scanDeviceResultsListener);
    _bluetoothScanningUseCase(dynamic).listen(_bluetoothScanningListener);
  }

  @override
  Future dispose() async {
    super.dispose();
    _bluetoothStateStreamSubscription.pause();
    await _stopBluetoothScanUseCase(dynamic);
  }

  Future<void> connectToDevice(ScanResult discoveryResult) async {
    // final device = discoveryResult.device;
    AppUIBlock.blockUI(context: Get.context);

    final response = await _connectToDeviceUseCase(discoveryResult);
    AppUIBlock.unblock(context: Get.context);

    // final data = state.value.data ?? [];
    // final existingIndex = data.indexWhere((element) => element.device.address == device.address);
    // if (existingIndex >= 0)
    //   data[existingIndex] = BluetoothDiscoveryResult(
    //     device: BluetoothDevice(
    //       name: device.name ?? '',
    //       address: device.address,
    //       type: device.type,
    //       bondState: response ? BluetoothBondState.bonded : BluetoothBondState.none,
    //     ),
    //     rssi: discoveryResult.rssi,
    //   );

    // state.value = Resource.success(data: data);
    // state.refresh();
    if (response) {
      Get.toNamed(Routes.configureWiFi, arguments: discoveryResult);
    }
  }

  void _scanDeviceResultsListener(Resource<dynamic> resource) {
    final data = state.value.data ?? [];
    final result = resource.data;
    if (result != null) {
      data.add(result);
      state.value = Resource.success(data: data);
    }
    // if (result != null && result.device.name != null) {
    //   print('AutoScanController._scanDeviceResultsListener: ${result.device.name}');
    //
    //   final existingIndex = data.indexWhere((element) => element.device.address == result.device.address);
    //   if (existingIndex >= 0)
    //     data[existingIndex] = result;
    //   else
    //     data.add(result);
    //
    //   state.value = Resource.success(data: data);
    // }
    // _stopBluetoothScanUseCase(dynamic);
  }

  void _bluetoothScanningListener(Resource<bool> resource) {
    print('AutoScanController.startScan: ${resource.data}');
    isScanning(resource.data);
  }
}
