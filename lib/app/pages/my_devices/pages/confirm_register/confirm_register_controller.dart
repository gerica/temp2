import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/data/model/app_exception.dart';
import 'package:radio_life/app/data/repositories/my_device/my_device_repository.dart';
import 'package:radio_life/app/domain/entities/device/device_entity.dart';
import 'package:radio_life/app/pages/base_controller.dart';
import 'package:radio_life/app/pages/my_devices/my_devices_controller.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';

class ConfirmRegisterController extends BaseController {
  final _myDeviceRepository = MyDeviceRepository();

  TextEditingController nameController = TextEditingController();

  TextEditingController locationController = TextEditingController();
  final FocusNode locationFocus = FocusNode();
  final locationError = ''.obs;
  final serialNumber = ''.obs;

  @override
  void onReady() {
    super.onReady();
    final param = tryCast<String>(Get.arguments);

    if (param != null) {
      serialNumber(param);
    }
  }

  Future<void> pressRegister() async {
    print('ConfirmRegisterController.pressRegister');
    // if (!_isValid) return;
    AppUIBlock.blockUI(context: Get.context);
    final entity = MyDeviceEntity(
        serialNumber: serialNumber.value,
        name: nameController.text,
        balance: null,
        id: null,
        locate: null,
        status: null,
        type: null,
        lastUpdate: null);
    final response = await _myDeviceRepository.confirmRegister(entity: entity);
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        await Get.delete<MyDevicesController>();
        Get.offAllNamed(Routes.myDevices);
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
  }
}
