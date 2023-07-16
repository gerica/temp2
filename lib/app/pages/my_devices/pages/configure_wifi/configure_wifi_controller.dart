import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/data/model/app_exception.dart';
import 'package:radio_life/app/data/repositories/my_device/device_repository.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/base_controller.dart';
import 'package:radio_life/app/pages/my_devices/model/add_new_device_model.dart';
import 'package:radio_life/app/pages/my_devices/model/configure_wifi_model.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/app/widget/dialog/list_wifis_widget.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';

class ConfigureWiFiController extends BaseController {
  final _deviceRepository = DeviceRepository();

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
    // _streamSubscription = _deviceRepository.checkConnectivity.listen((event) {
    //   _connectivityStateListener(event);
    // });

    _updateWiFiSSID();
    final param = tryCast<AddNewDevice>(Get.arguments);

    if (param != null) {
      paramsNewDevice = param;
    }
  }

  void get togglePasswordVisibility {
    hidePassword.value = !hidePassword.value;
  }

  // Future _connectivityStateListener(connectivity.ConnectivityResult result) async {
  //   if (result == connectivity.ConnectivityResult.mobile) {
  //     Get.appDialog(
  //         pageChild: AppSimpleDialog(
  //           title: S.current.wifiRequired,
  //           message: S.current.pleaseConnectToAWifiNetworkToContinue,
  //           icon: Icon(Icons.warning_amber_outlined, size: 50, color: AppColorScheme.primarySwatch),
  //           onOkPressed: () {
  //             //AppSettings.openWIFISettings();
  //           },
  //         ),
  //         barrierDismissible: false);
  //   } else {
  //     _updateWiFiSSID();
  //   }
  // }

  void openAppSettings() {
    Get.appDialog(
      pageChild: ListWifisWidget(
        onSelected: (value) {
          wifiSSIDNumberController.text = value;
        },
      ),
    );
  }

  Future _updateWiFiSSID() async {
    final ssid = await _deviceRepository.getWifiSSID;
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
    final response = await _deviceRepository.configureWifi(ConfigureWifiModel(
      device: paramsNewDevice.device,
      ssid: wifiSSIDNumberController.text,
      password: wifiPasswordController.text,
    ));
    AppUIBlock.unblock(context: Get.context);

    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        Get.toNamed(Routes.confirmRegister, arguments: paramsNewDevice.serialNumber);
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic(), actionBack: false);
        break;
    }
  }

//endregion
}
