import 'dart:async';
import 'dart:convert';

import 'package:collection/src/iterable_extensions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/device/device_repository.dart';
import 'package:radio_life/core/domain/use_cases/device/configure_wifi_use_case.dart';
import 'package:wifi_iot/wifi_iot.dart';

// ignore_for_file: slash_for_doc_comments, constant_identifier_names, implementation_imports

@Singleton(as: DeviceRepository)
class DeviceRepositoryImplementation extends DeviceRepository {
  final FlutterBlue _flutterBlue;
  static const SERVICE_UUID = 'a091622c-8aad-11ec-a8a3-0242ac120002';
  static const CHARACTERISTIC_UUID_RX = '645b5776-77fa-4cb5-a547-fb969a5340e9';
  static const CHARACTERISTIC_UUID_TX = '109ed2ab-b946-49c2-a836-4afaeb848dd8';

  static const CMD_CONNECT = 'conect';
  static const CMD_OTA = 'ota';
  static const CMD_SSID = 'redeSSID';
  static const CMD_PASSWORD = 'redePass';
  static const CMD_DISCONNECT = 'disconect';
  static const CMD_RESET = 'reset';
  static const CMD_LIGHT_ON = 'l1';
  static const CMD_LIGHT_OFF = 'l0';
  static const CMD_LIGHT_BLINK = 'lauto';

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
  Future<Resource<bool>> connectToDevice(BluetoothDevice params) async {
    try {
      await _connectToDevice(params).timeout(const Duration(seconds: 5));
      stopBluetoothScan;
      return Resource.success(data: true);
    } on TimeoutException catch (e) {
      return Resource.failed(
          error: AppException(
        title: 'Error to connect to device',
        description: e.message,
      ));
    }
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

  /**
   * comandos:
   * conect
   *  retorna:--> Informe SSID
   *  Depois desse comando ele pede o SSID da rede wifi, e em seguida ele pede a senha, eu não consegui deixar tudo em uma comando so, pois o serviço BLE tem um limite de caracteres.
   * ota
   *  Faz a requisição para atualizar a placa pelo servidor. Essa requisição também e feita toda vez que a placa se inicializa.
   * redeSSID
   *  Retorna o nome da rede que esta conectado ou "" caso não esteja conectado.
   * redePass
   *  Retorna o Pasword da rede conectada
   * disconect
   *  Desconecta da rede wifi
   * reset
   *  Reseta as configurações do wifi, esse comando faz com que a placa esqueça as configurações do wifi.
   * l1
   *  Led On
   * l0
   *  Led OFF
   * lauto
   *  Led Blink
   */
  @override
  Future<Resource<String>> configureWifi(ConfigureWifiParam param) async {
    final List<BluetoothService> services = await param.device.discoverServices();

    final service = services.firstWhereOrNull((s) => s.uuid.toString() == SERVICE_UUID);
    //
    if (service != null) {
      final characteristics = service.characteristics;
      final txCharacteristics = characteristics.firstWhere((c) => c.uuid.toString() == CHARACTERISTIC_UUID_TX);
      final rxCharacteristics = characteristics.firstWhere((c) => c.uuid.toString() == CHARACTERISTIC_UUID_RX);

      await _writeToDevice(rxCharacteristics, CMD_CONNECT);
      print(await _readFromDevice(txCharacteristics));
      await _writeToDevice(rxCharacteristics, param.ssid);
      print(await _readFromDevice(txCharacteristics));
      await _writeToDevice(rxCharacteristics, param.password);
      final result = await _readFromDevice(txCharacteristics);
      print('DeviceRepositoryImplementation.configureWifi: $result');

      if (result.toLowerCase().contains('erro')) {
        return Resource.failed(
            error: AppException(
          title: 'Error to configure wifi',
          description: result,
        ));
      }
      return Resource.success(data: result);
    }
    return Resource.failed(
        error: AppException(
      title: 'Error to configure wifi',
      description: 'service not found',
    ));
  }

  Future<String> _readFromDevice(BluetoothCharacteristic charact) async {
    final List<int> value = await charact.read();
    return utf8.decode(value);
  }

  Future<void> _writeToDevice(BluetoothCharacteristic charact, String command) async {
    await charact.write(utf8.encode(command));
  }
}
