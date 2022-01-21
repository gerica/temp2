import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/my_devices/adapter/my_devices_adapter.dart';
import 'package:radio_life/app/pages/my_devices/model/device_filter_model.dart';
import 'package:radio_life/app/pages/my_devices/model/my_device_model.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/use_cases/my_devices/get_my_devices_use_case.dart';

import '../../radio_life_app_routes.dart';

class MyDevicesController extends GetxController {
  MyDevicesController(
    this._getMyDevicesUseCase,
  );

  final GetMyDevicesUseCase _getMyDevicesUseCase;
  final deviceFilter = DeviceFilter.empty().obs;

  final state = Resource.loading<List<MyDeviceModel?>>().obs;
  final mydevices = Resource.loading<List<MyDeviceModel?>>().obs;

  @override
  void onReady() {
    super.onReady();
    getMyDevices();
  }

  Future getMyDevices() async {
    AppUIBlock.blockUI(context: Get.context);
    final response = await _getMyDevicesUseCase();
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        final data = response.data;
        if (data != null) {
          state.value = Resource.success(data: data.toModelList);
          mydevices.value = Resource.success(data: data.toModelList);
        }
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
  }

  void handleError(AppException error) {
    if (error.description == 'Please Login Again!') {
      Get.offAllNamed(Routes.signIn);
    }
    Get.appDialog(
      barrierDismissible: false,
      pageChild: AppSimpleDialog(
        title: error.title ?? '',
        message: error.description ?? '',
        icon: Icon(Icons.error_outline, size: 50, color: AppColorScheme.error),
        onClosePressed: () {
          Get.back();
        },
      ),
    );
  }

  Future<void> applyFilter() async {
    final List<MyDeviceModel?>? result = [...?mydevices.value.data];

    if (deviceFilter.value.device != null) {
      result?.removeWhere((element) => element?.id != deviceFilter.value.device?.id);
    }

    state.value = Resource.success(data: result);
  }
}
