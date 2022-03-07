import 'package:flutter_blue/flutter_blue.dart';

class AddNewDevice {
  final BluetoothDevice device;
  final String serialNumber;

  AddNewDevice({required this.device, required this.serialNumber});
}
