import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:wifi_iot/wifi_iot.dart';

@Singleton(as: DeviceRepository)
class DeviceRepositoryImplementation extends DeviceRepository {
  final FlutterBlue _flutterBlue;

  DeviceRepositoryImplementation(this._flutterBlue);

  @override
  Stream<Resource<ScanResult>> scanBluetoothDevices() =>
      _flutterBlue.scan(timeout: const Duration(minutes: 2)).transform(
            StreamTransformer<ScanResult, Resource<ScanResult>>.fromHandlers(
                handleData: (data, sink) {
              sink.add(Resource.success(data: data));
            }, handleError: (error, stackTrace, sink) {
              sink.add(Resource.failed(error: AppException.generic()));
            }),
          );

  @override
  Future get startBluetoothScan => _flutterBlue.startScan();

  @override
  Future get stopBluetoothScan => _flutterBlue.stopScan();

  @override
  Stream<Resource<BluetoothState>> get checkBluetoothState =>
      _flutterBlue.state.transform(
        StreamTransformer<BluetoothState,
            Resource<BluetoothState>>.fromHandlers(handleData: (data, sink) {
          sink.add(Resource.success(data: data));
        }, handleError: (error, stackTrace, sink) {
          sink.add(Resource.failed(error: AppException.generic()));
        }),
      );

  @override
  Stream<ConnectivityResult> get checkConnectivity =>
      Connectivity().onConnectivityChanged;

  @override
  Future<String?> get getWifiSSID => WiFiForIoTPlugin.getSSID();
}
