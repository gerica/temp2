import 'dart:async';
import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/data/model/app_exception.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/pages/my_devices/model/configure_wifi_model.dart';
import 'package:wifi_iot/wifi_iot.dart';

// ignore_for_file: slash_for_doc_comments, constant_identifier_names, implementation_imports

class DeviceRepository {
  // final _flutterBlue = FlutterBlue.instance;
  final _flutterBlue = FlutterBluePlus.instance;
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
  static const CMD_STATUS = 'status';

  @override
  Stream<Resource<ScanResult>> get startBluetoothScan {
    print('DeviceRepository.startBluetoothScan');
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

  // @override
  // Stream<ConnectivityResult> get checkConnectivity => Connectivity().onConnectivityChanged;

  @override
  Future<String?> get getWifiSSID async {
    final frequency = await WiFiForIoTPlugin.getFrequency();
    // 5G não funciona na placa do cubo
    if (frequency != null && frequency < 3000) {
      return WiFiForIoTPlugin.getSSID();
    }
    return '';
  }

  @override
  Future<Resource<bool>> connectToDevice(BluetoothDevice params) async {
    try {
      await _connectToDevice(params).timeout(const Duration(seconds: 5));
      stopBluetoothScan;
      return Resource.success(data: true);
    } on TimeoutException catch (e) {
      return Resource.failed(
          error: AppException(
        title: 'Error with connecting',
        description: e.message,
      ));
    }
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    final connectedDevices = await _flutterBlue.connectedDevices;
    if (connectedDevices.isNotEmpty) {
      final connectedDevice = connectedDevices.firstWhereOrNull((d) => d.id == device.id);

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
   *  Depois desse comando ele pede o SSID da rede wifi, e em seguida ele pede a senha
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
   *  status
   *   retorna -> Conectado
   *       ou  -> Erro
   */
  @override
  Future<Resource<String>> configureWifi(ConfigureWifiModel param) async {
    // await _doBluetooth(param);
    final List<BluetoothService> services = await param.device.discoverServices();

    final service = services.firstWhereOrNull((s) => s.uuid.toString() == SERVICE_UUID);
    //
    if (service != null) {
      try {
        final characteristics = service.characteristics;

        final rxCharacteristics = characteristics.firstWhere((c) => c.uuid.toString() == CHARACTERISTIC_UUID_RX);
        final txCharacteristics = characteristics.firstWhere((c) => c.uuid.toString() == CHARACTERISTIC_UUID_TX);

        await _writeToDevice(rxCharacteristics, CMD_CONNECT);
        await _writeToDevice(rxCharacteristics, param.ssid);
        await _writeToDevice(rxCharacteristics, param.password);
        var result = '';

        var toContinue = true;
        var optimistic = true;
        var count = 0;
        await Future.doWhile(() async {
          if (optimistic) {
            await Future.delayed(const Duration(seconds: 1));
          } else {
            await Future.delayed(const Duration(seconds: 5));
          }
          result = await _readFromDevice(txCharacteristics);
          if (result == 'Conectado') {
            toContinue = false;
          } else if (result.toLowerCase().contains('erro')) {
            // result = 'Error. The ssid or password are wrong!';
            toContinue = false;
          }
          count++;
          if (count >= 10) {
            optimistic = false;
          }
          return toContinue;
        }).timeout(const Duration(seconds: 70), onTimeout: () {
          result = 'Error. Timeout the cube doesn\'t respond!';
          toContinue = false;
        });

        // await _writeToDevice(rxCharacteristics, CMD_RESET);
        // final result = await _readFromDevice(txCharacteristics);
        // print('DeviceRepositoryImplementation.configureWifi: $result');

        if (result.toLowerCase().contains('erro')) {
          return Resource.failed(
              error: AppException(
            title: 'Error to configure wifi',
            description: result,
          ));
        }
        return Resource.success(data: result);
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
        // e.printError(info: );
        print(e.toString());
        return Resource.failed(
            error: AppException(
          title: 'Error to configure wifi',
          description: e.toString(),
        ));
      }
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
    // print(utf8.encode(command));
    await charact.write(utf8.encode(command), withoutResponse: true);
  }
}
