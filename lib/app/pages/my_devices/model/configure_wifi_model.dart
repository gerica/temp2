import 'package:flutter_blue/flutter_blue.dart';

class ConfigureWifiModel {
  final BluetoothDevice device;
  final String ssid;
  final String password;

  ConfigureWifiModel({required this.device, required this.ssid, required this.password});
}
