import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/use_cases/device/scan_bluetooth_devices_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/start_scan_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/stop_scan_use_case.dart';

class AutoScanController extends GetxController {
  AutoScanController(
    this._scanBluetoothDevicesUseCase,
    this._startBluetoothScanUseCase,
    this._stopBluetoothScanUseCase,
  );

  //region Use Cases
  final ScanBluetoothDevicesUseCase _scanBluetoothDevicesUseCase;
  final StartBluetoothScanUseCase _startBluetoothScanUseCase;
  final StopBluetoothScanUseCase _stopBluetoothScanUseCase;

  //endregion

  //region State
  final state = Resource.loading<List<ScanResult>?>().obs;

//endregion

  //region Variables
  late StreamSubscription _streamSubscription;

  //endregion

//region Functions
  @override
  void onInit() {
    super.onInit();
    _streamSubscription = _scanBluetoothDevicesUseCase(dynamic).listen(scanDeviceResultsListener);
    _startBluetoothScanUseCase(dynamic);
  }

  void scanDeviceResultsListener(Resource<List<ScanResult>?> resource) {
    state.value = resource;
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.pause();
    _stopBluetoothScanUseCase(dynamic);
  }

//endregion

}
