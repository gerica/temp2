import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/helper/validation_helper.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/domain/use_cases/my_devices/get_device_check_register_use_case.dart';
import '../../../../../generated/l10n.dart';

import '../../../../radio_life_app_routes.dart';

class AddNewDeviceController extends GetxController {
  TextEditingController serialNumberController = TextEditingController();
  final FocusNode serialNumberFocus = FocusNode();
  final serialNumberError = ''.obs;
  TextEditingController locationController = TextEditingController();
  final FocusNode locationFocus = FocusNode();
  final locationError = ''.obs;

  final GetDeviceCheckRegisterUseCase _getDeviceCheckRegisterUseCase;

  AddNewDeviceController(this._getDeviceCheckRegisterUseCase);

  Future<void> pressContinue() async {
    if (!_isValid) return;
    AppUIBlock.blockUI(context: Get.context);
    // Get.toNamed(Routes.autoScanPage);

    final response = await _getDeviceCheckRegisterUseCase(serialNumberController.text);
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        final deviceCheckRegister = response.data;
        if (deviceCheckRegister!.canUse) {
          Get.toNamed(Routes.autoScanPage);
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

  @override
  void onReady() {
    super.onReady();
    serialNumberController.text = '9000';
    locationController.text = 'Scholl';
  }

  bool get _isValid {
    bool result = true;
    serialNumberError('');
    locationError('');
    final tempSN = ValidationHelper.validateField(serialNumberController.text);
    if (tempSN != null) {
      serialNumberError(tempSN);
      result = false;
    }
    final tempLocation = ValidationHelper.validateField(locationController.text);
    if (tempLocation != null) {
      locationError(tempLocation);
      result = false;
    }
    return result;
  }

  void handleError(AppException error) {
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
}
