import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/device/configure_wifi_use_case.dart';
import 'package:wifi_iot/wifi_iot.dart';

@Singleton(as: DeviceRepository)
class DeviceRepositoryImplementation extends DeviceRepository {
  final FlutterBlue _flutterBlue;
  static const uuidDeviceCustomService = 'a091622c-8aad-11ec-a8a3-0242ac120002';

  DeviceRepositoryImplementation(this._flutterBlue);

  @override
  Stream<Resource<ScanResult>> get startBluetoothScan {
    return _flutterBlue.scan(timeout: const Duration(seconds: 30)).transform(
          StreamTransformer<ScanResult, Resource<ScanResult>>.fromHandlers(handleData: (data, sink) {
            sink.add(Resource.success(data: data));
          }, handleError: (error, stackTrace, sink) {
            sink.add(Resource.failed(error: AppException.generic()));
          }),
        );
  }

  @override
  Future<List<BluetoothDevice>> get bluetoothConnected {
    return _flutterBlue.connectedDevices;
  }

  @override
  Stream<Resource<bool>> get isScanning {
    return _flutterBlue.isScanning.asBroadcastStream().transform(
          StreamTransformer<bool, Resource<bool>>.fromHandlers(handleData: (data, sink) {
            sink.add(Resource.success(data: data));
          }, handleError: (error, stackTrace, sink) {
            sink.add(Resource.failed(error: AppException.generic()));
          }),
        );
  }

  @override
  Future get stopBluetoothScan => _flutterBlue.stopScan();

  @override
  Stream<Resource<BluetoothState>> get checkBluetoothState {
    return _flutterBlue.state.transform(
      StreamTransformer<BluetoothState, Resource<BluetoothState>>.fromHandlers(handleData: (data, sink) {
        sink.add(Resource.success(data: data));
      }, handleError: (error, stackTrace, sink) {
        sink.add(Resource.failed(error: AppException.generic()));
      }),
    );
  }

  @override
  Stream<ConnectivityResult> get checkConnectivity => Connectivity().onConnectivityChanged;

  @override
  Future<String?> get getWifiSSID => WiFiForIoTPlugin.getSSID();

  @override
  Future<bool> connectToDevice(BluetoothDevice params) async {
    try {
      await _connectToDevice(params).timeout(const Duration(seconds: 5));
      stopBluetoothScan;
      return true;
    } on TimeoutException catch (e) {
      print('DeviceRepositoryImplementation.connectToDevice: TIMEOUT : ${e.message}');
    }

    return false;
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    final connectedDevices = await _flutterBlue.connectedDevices;
    if (connectedDevices.isNotEmpty) {
      final connectedDevice = connectedDevices.firstWhere((d) => d.id == device.id);

      if (connectedDevice == null) {
        await device.connect();
      }
    } else {
      await device.connect();
    }
  }

  Future<void> _discoverServices(BluetoothDevice device) async {
    final List<BluetoothService> services = await device.discoverServices();

    services.forEach((service) async {
      if (service.uuid.toString() == 'a091622c-8aad-11ec-a8a3-0242ac120002') {
        // print('Info service bluetooth: ${service.isPrimary}');
        final characteristics = service.characteristics;
        final targetCharacteristic = characteristics[0];

        final List<int> bytes = utf8.encode('l0');
        targetCharacteristic.write(bytes);
        // Future.delayed(const Duration(milliseconds: 500), () async {
        //   print('Entered the loop...');
        //   final characteristics = service.characteristics;
        //   for (final BluetoothCharacteristic c in characteristics) {
        //     final List<int> value = await c.read();
        //     final String stringValue = String.fromCharCodes(value);
        //     print('The recieved Characteristic Value is $stringValue and $value');
        //     print('Entered the second loop...');
        //     final descriptors = c.descriptors;
        //     print('The descriptors value is equal to: $descriptors');
        //     for (final BluetoothDescriptor d in descriptors) {
        //       final List<int> value = await d.read();
        //       print('Entered the third loop...');
        //       final String stringValue = String.fromCharCodes(value);
        //       print('The recieved Value is $stringValue and $value');
        //     }
        //   }
        // });
      }
    });
  }

  @override
  Future<void> configureWifi(ConfigureWifiParam param) async {
    final List<BluetoothService> services = await param.device.discoverServices();

    final service = services.firstWhere((s) => s.uuid.toString() == uuidDeviceCustomService);

    if (service != null) {
      final characteristics = service.characteristics;
      final targetCharacteristic = characteristics[0];

      final List<int> bytes = utf8.encode(param.password);
      targetCharacteristic.write(bytes);
    }
  }
}
