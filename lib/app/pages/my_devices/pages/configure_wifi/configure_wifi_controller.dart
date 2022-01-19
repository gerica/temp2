import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart' as connectivity;
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/domain/use_cases/device/check_connectivity_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/get_wifi_ssid_use_case.dart';

import '../../../../../generated/l10n.dart';
import '../../../../helper/dialog_helper.dart';

class ConfigureWiFiController extends GetxController {
  ConfigureWiFiController(
    this._checkConnectivityUseCase,
    this._getWiFiSSIDUseCase,
  );

  //region Use cases
  final CheckConnectivityUseCase _checkConnectivityUseCase;
  final GetWiFiSSIDUseCase _getWiFiSSIDUseCase;

  TextEditingController wifiSSIDNumberController = TextEditingController();
  TextEditingController wifiPasswordController = TextEditingController();
  late StreamSubscription _streamSubscription;
  final hidePassword = true.obs;
  final deviceResult = BluetoothDiscoveryResult(device: const BluetoothDevice(address: '')).obs;
  late BluetoothConnection connection;

  @override
  Future<void> onReady() async {
    super.onReady();
    final param = tryCast<BluetoothDiscoveryResult>(Get.arguments);

    if (param != null) {
      deviceResult(param);
      await connect();
    }
  }

  @override
  void onInit() {
    super.onInit();
    _streamSubscription = _checkConnectivityUseCase().listen((event) {
      _connectivityStateListener(event);
    });
    _updateWiFiSSID();
  }

  void get togglePasswordVisibility {
    hidePassword.value = !hidePassword.value;
  }

  Future _connectivityStateListener(connectivity.ConnectivityResult result) async {
    if (result == connectivity.ConnectivityResult.mobile) {
      Get.appDialog(
          pageChild: AppSimpleDialog(
            title: S.current.wifiRequired,
            message: S.current.pleaseConnectToAWifiNetworkToContinue,
            icon: Icon(Icons.warning_amber_outlined, size: 50, color: AppColorScheme.primarySwatch),
            onOkPressed: () {
              //AppSettings.openWIFISettings();
            },
          ),
          barrierDismissible: false);
    } else {
      _updateWiFiSSID();
    }
  }

  void openAppSettings() {
    AppSettings.openWIFISettings();
  }

  Future _updateWiFiSSID() async {
    final ssid = await _getWiFiSSIDUseCase();
    if (ssid != null) wifiSSIDNumberController.text = ssid;
  }

  @override
  Future dispose() async {
    super.dispose();
    await _streamSubscription.cancel();
    await connection.finish();
  }

  Future<void> nextPage() async {
    AppUIBlock.blockUI(context: Get.context);
    // await Future.delayed(const Duration(milliseconds: 500));
    print('ConfigureWiFiController.nextPage: ${deviceResult.value.device.address}');

    connection.output.add(Uint8List.fromList(utf8.encode('text \r\n')));
    await connection.output.allSent;
    print('ConfigureWiFiController.nextPage: sent message');
    AppUIBlock.unblock(context: Get.context);
  }

  Future<void> connect() async {
    connection = await BluetoothConnection.toAddress(deviceResult.value.device.address);
    print('ConfigureWiFiController.connect: Connected to the device');

    connection.input?.listen((Uint8List data) {
      print('ConfigureWiFiController.connect: Data incoming: ${ascii.decode(data)}');
      connection.output.add(data); // Sending data

      if (ascii.decode(data).contains('!')) {
        connection.finish(); // Closing connection
        print('ConfigureWiFiController.connect: Disconnecting by local host');
      }
    }).onDone(() {
      print('ConfigureWiFiController.connect: Disconnected by remote request');
    });
  }
}
