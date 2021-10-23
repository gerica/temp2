import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/core/data/model/app_exception.dart';

class ConfirmRegisterController extends GetxController {
  ConfirmRegisterController();
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
