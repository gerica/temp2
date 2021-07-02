import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';

@Singleton(as: DeviceRepository)
class DeviceRepositoryImplementation extends DeviceRepository {
  final FlutterBlue _flutterBlue;

  DeviceRepositoryImplementation(this._flutterBlue);

  @override
  Stream<Resource<List<ScanResult>>> scanBluetoothDevices() => _flutterBlue.scanResults.transform(
        StreamTransformer<List<ScanResult>, Resource<List<ScanResult>>>.fromHandlers(
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
}
