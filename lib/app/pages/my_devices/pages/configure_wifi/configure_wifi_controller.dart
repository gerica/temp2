import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart' as connectivity;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/base_controller.dart';
import 'package:radio_life/app/pages/my_devices/model/add_new_device_model.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/domain/use_cases/device/check_connectivity_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/configure_wifi_use_case.dart';
import 'package:radio_life/core/domain/use_cases/device/get_wifi_ssid_use_case.dart';

import 'package:radio_life/generated/l10n.dart';

class ConfigureWiFiController extends BaseController {
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
  final formValid = false.obs;

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

  void validated() {
    formValid(wifiPasswordController.text.isNotEmpty && wifiSSIDNumberController.text.isNotEmpty);
  }

  Future<void> nextPage() async {
    if (formValid.isFalse) {
      return;
    }

    AppUIBlock.blockUI(context: Get.context);
    FocusManager.instance.primaryFocus?.unfocus();
    final response = await _configureWifiUseCase(ConfigureWifiParam(
      device: paramsNewDevice.device,
      ssid: wifiSSIDNumberController.text,
      password: wifiPasswordController.text,
    ));
    AppUIBlock.unblock(context: Get.context);

    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        print('ConfigureWiFiController.nextPage: Success');
        // Get.toNamed(Routes.confirmRegister, arguments: paramsNewDevice.serialNumber);
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic(), actionBack: false);
        break;
    }
  }

//endregion

}
