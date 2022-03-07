import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart' as connectivity;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/my_devices/model/add_new_device_model.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/core/domain/use_cases/device/check_connectivity_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/configure_wifi_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/get_wifi_ssid_use_case.dart';

import 'package:radio_life/generated/l10n.dart';

class ConfigureWiFiController extends GetxController {
  ConfigureWiFiController(
    this._checkConnectivityUseCase,
    this._getWiFiSSIDUseCase,
    this._configureWifiUseCase,
  );

  //region Use cases
  final CheckConnectivityUseCase _checkConnectivityUseCase;
  final GetWiFiSSIDUseCase _getWiFiSSIDUseCase;
  final ConfigureWifiUseCase _configureWifiUseCase;
  late AddNewDevice paramsNewDevice;

  //endregion

  //region Variables
  TextEditingController wifiSSIDNumberController = TextEditingController();
  TextEditingController wifiPasswordController = TextEditingController();
  late StreamSubscription _streamSubscription;
  final hidePassword = true.obs;

  //endregion

  //region Functions
  @override
  void onInit() {
    super.onInit();
    _streamSubscription = _checkConnectivityUseCase().listen((event) {
      _connectivityStateListener(event);
    });

    _updateWiFiSSID();
    final param = tryCast<AddNewDevice>(Get.arguments);

    if (param != null) {
      paramsNewDevice = param;
    }
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
  }

  Future<void> nextPage() async {
    await _configureWifiUseCase(ConfigureWifiParam(
      device: paramsNewDevice.device,
      ssid: wifiSSIDNumberController.text,
      password: wifiPasswordController.text,
    ));
    Get.toNamed(Routes.confirmRegister, arguments: paramsNewDevice.serialNumber);
  }

//endregion

}
