import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';
import 'package:radio_life/core/domain/use_cases/my_devices/confirm_regiser_use_case.dart';

class ConfirmRegisterController extends GetxController {
  final ConfirmRegisterUseCase _confirmRegisterUseCase;

  TextEditingController nameController = TextEditingController();

  ConfirmRegisterController(this._confirmRegisterUseCase);

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
        lastUpdate: null,
        locate: null,
        status: null,
        type: null);
    final response = await _confirmRegisterUseCase(entity);
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        Get.offAllNamed(
          Routes.myDevices,
          predicate: ModalRoute.withName('/'),
        );
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
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
