import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:wifi_iot/wifi_iot.dart';

@Singleton(as: DeviceRepository)
class DeviceRepositoryImplementation extends DeviceRepository {
  final FlutterBluetoothSerial _bluetoothSerial;

  DeviceRepositoryImplementation(this._bluetoothSerial);

  @override
  Stream<Resource<BluetoothDiscoveryResult>> get startBluetoothScan {
    return _bluetoothSerial.startDiscovery().transform(
          StreamTransformer<BluetoothDiscoveryResult, Resource<BluetoothDiscoveryResult>>.fromHandlers(
              handleData: (data, sink) {
            sink.add(Resource.success(data: data));
          }, handleError: (error, stackTrace, sink) {
            sink.add(Resource.failed(error: AppException.generic()));
          }),
        );
  }

  @override
  Future get stopBluetoothScan => _bluetoothSerial.cancelDiscovery();

  @override
  Stream<Resource<BluetoothState>> get checkBluetoothState => _bluetoothSerial.state.asStream().transform(
        StreamTransformer<BluetoothState, Resource<BluetoothState>>.fromHandlers(handleData: (data, sink) {
          sink.add(Resource.success(data: data));
        }, handleError: (error, stackTrace, sink) {
          sink.add(Resource.failed(error: AppException.generic()));
        }),
      );

  @override
  Stream<ConnectivityResult> get checkConnectivity => Connectivity().onConnectivityChanged;

  @override
  Future<String?> get getWifiSSID => WiFiForIoTPlugin.getSSID();

  @override
  Future<bool> connectToDevice(dynamic params) async {
    final device = params.device;
    print('DeviceRepositoryImplementation.connectToDevice: ${device.address}');

    // return Resource.asFuture(
    //   // () => Future.delayed(const Duration(seconds: 5), () => true),
    //   () => _bluetoothSerial.bondDeviceAtAddress(device.address),
    //   (data) {
    //     print('DeviceRepositoryImplementation.connectToDevice: ${data}');
    //     return data;
    //   },
    // );

    // if (device.isBonded) {
    //   print('Unbonding from ${device.address}...');
    //   await FlutterBluetoothSerial.instance.removeDeviceBondWithAddress(device.address);
    //   print('Unbonding from ${device.address} has succed');
    // } else {
    //   print('Bonding with ${device.address}...');
    //   bonded = (await FlutterBluetoothSerial.instance.bondDeviceAtAddress(device.address))!;
    //   print('Bonding with ${device.address} has ${bonded ? 'succed' : 'failed'}.');
    // }
    if (device.isBonded) {
      await _bluetoothSerial.removeDeviceBondWithAddress(device.address);
      return false;
    }
    return (await _bluetoothSerial.bondDeviceAtAddress(device.address))!;
    // return Future.delayed(const Duration(seconds: 10), () => true);
  }
}
