import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/use_cases/device/configure_wifi_use_case.dart';

abstract class DeviceRepository {
  Stream<Resource<ScanResult>> get startBluetoothScan;
  Stream<Resource<bool>> get isScanning;
  Future get stopBluetoothScan;
  // Stream<Resource<BluetoothDiscoveryResult>> scanBluetoothDevices();
  Stream<Resource<BluetoothState>> get checkBluetoothState;
  Stream<ConnectivityResult> get checkConnectivity;
  Future<String?> get getWifiSSID;
  Future<bool> connectToDevice(BluetoothDevice params);
  Future<List<BluetoothDevice>> get bluetoothConnected;
  Future<void> configureWifi(ConfigureWifiParam param);
}
