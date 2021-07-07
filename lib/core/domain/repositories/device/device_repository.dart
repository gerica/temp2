import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:radio_life/core/data/model/resource.dart';

abstract class DeviceRepository{
  Future get startBluetoothScan;
  Future get stopBluetoothScan;
  Stream<Resource<ScanResult>> scanBluetoothDevices();
  Stream<Resource<BluetoothState>> get checkBluetoothState;
}