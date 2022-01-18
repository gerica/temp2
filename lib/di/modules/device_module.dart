import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';

@module
abstract class DeviceModule {
  @Named('language')
  String get language => Platform.localeName;

  FlutterBluetoothSerial get bluetoothSerial => FlutterBluetoothSerial.instance;

  ImagePicker get picker => ImagePicker();
}
