import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:radio_life/core/data/model/resource.dart';

abstract class DeviceRepository {
  Stream<Resource<BluetoothDiscoveryResult>> get startBluetoothScan;
  Future get stopBluetoothScan;
  // Stream<Resource<BluetoothDiscoveryResult>> scanBluetoothDevices();
  Stream<Resource<BluetoothState>> get checkBluetoothState;
  Stream<ConnectivityResult> get checkConnectivity;
  Future<String?> get getWifiSSID;
  Future<bool> connectToDevice(dynamic params);
}
