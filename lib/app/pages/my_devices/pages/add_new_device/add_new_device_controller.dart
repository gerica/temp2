import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/data/model/app_exception.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/data/repositories/my_device/my_device_repository.dart';
import 'package:radio_life/app/domain/entities/device/device_check_register.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/helper/validation_helper.dart';
import 'package:radio_life/app/pages/base_controller.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/generated/l10n.dart';

class AddNewDeviceController extends BaseController {
  TextEditingController serialNumberController = TextEditingController();
  final _repository = MyDeviceRepository();
  final FocusNode serialNumberFocus = FocusNode();
  final serialNumberError = ''.obs;

  // @override
  // void onReady() {
  //   super.onReady();
  //   // serialNumberController.text = '90000';
  // }

  Future<void> pressContinue() async {
    if (!_isValid) return;
    AppUIBlock.blockUI(context: Get.context);
    // Get.toNamed(Routes.autoScanPage);

    final response = await _repository.getDeviceCheckRegister(serialNumber: serialNumberController.text);
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        final deviceCheckRegister = response.data;
        if (deviceCheckRegister!.canUse) {
          _nextPage(response);
        } else {
          Get.appDialog(
            barrierDismissible: false,
            pageChild: AppSimpleDialog(
              title: S.current.warning,
              message: deviceCheckRegister.description,
              icon: Icon(Icons.warning_amber_outlined, size: 50, color: AppColorScheme.primarySwatch),
              onClosePressed: () {
                // Get.back(); // close dialog
              },
              onOkPressed: () {
                // Get.back(); // close dialog
              },
            ),
          );
        }
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
  }

  void _nextPage(Resource<DeviceCheckRegister> response) {
    // if (response.data!.status != null && response.data!.status == 'online') {
    //   Get.toNamed(Routes.confirmRegister, arguments: serialNumberController.text);
    // } else {
    Get.toNamed(Routes.autoScanPage, arguments: serialNumberController.text);
    // }
  }

  bool get _isValid {
    bool result = true;
    serialNumberError('');

    final tempSN = ValidationHelper.validateField(serialNumberController.text);
    if (tempSN != null) {
      serialNumberError(tempSN);
      result = false;
    }

    return result;
  }
}
