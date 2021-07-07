import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/use_cases/device/check_bluetooth_state_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/scan_bluetooth_devices_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/start_scan_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/stop_scan_use_case.dart';

class AutoScanController extends GetxController {
  AutoScanController(
    this._scanBluetoothDevicesUseCase,
    this._startBluetoothScanUseCase,
    this._stopBluetoothScanUseCase,
    this._checkBluetoothStateUseCase,
  );

  //region Use Cases
  final ScanBluetoothDevicesUseCase _scanBluetoothDevicesUseCase;
  final StartBluetoothScanUseCase _startBluetoothScanUseCase;
  final StopBluetoothScanUseCase _stopBluetoothScanUseCase;
  final CheckBluetoothStateUseCase _checkBluetoothStateUseCase;

  //endregion

  //region State
  final state = Resource.loading<List<ScanResult>?>().obs;
  final bluetoothState = BluetoothState.unknown.obs;

  //endregion

  //region Variables
  late StreamSubscription _scanDeviceStreamSubscription;
  late StreamSubscription _bluetoothStateStreamSubscription;

  //endregion

  //region Functions
  @override
  void onInit() {
    super.onInit();
    _bluetoothStateStreamSubscription =
        _checkBluetoothStateUseCase().listen(bluetoothStateListener);
    _scanDeviceStreamSubscription =
        _scanBluetoothDevicesUseCase(dynamic).listen(scanDeviceResultsListener);
  }

  void scanDeviceResultsListener(Resource<ScanResult?> resource) {
    final data = state.value.data ?? [];
    final result = resource.data;
    if (result != null) {
      data.add(result);
      state.value = Resource.success(data: data);
    }
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

  void startScan() {
    state.value = Resource.loading(data: state.value.data);
    //_startBluetoothScanUseCase(dynamic);
  }

  @override
  void dispose() {
    super.dispose();
    _scanDeviceStreamSubscription.pause();
    _bluetoothStateStreamSubscription.pause();
    _stopBluetoothScanUseCase(dynamic);
  }

//endregion

}
