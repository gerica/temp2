import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class AddNewDevice {
  final BluetoothDevice device;
  final String serialNumber;

  AddNewDevice({required this.device, required this.serialNumber});
}
