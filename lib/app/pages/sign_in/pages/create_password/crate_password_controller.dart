import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/domain/use_cases/auth/change_password_use_case.dart';

import 'package:radio_life/generated/l10n.dart';

class CreatePasswordController extends GetxController {
  CreatePasswordController(this._changePasswordUseCase);

  //region Use cases
  final ChangePasswordUseCase _changePasswordUseCase;

  //endregion

  //region Variables
  final TextEditingController temporaryPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

//endregion

//region Functions

  Future performChangePassword() async {
    AppUIBlock.blockUI(context: Get.context);
    final response = await _changePasswordUseCase(ChangePasswordParams(
        currentPassword: temporaryPasswordController.text, newPassword: newPasswordController.text));
    AppUIBlock.unblock(context: Get.context);
    final data = response.data;
    if (response.status == Status.success && data != null) {
      Get.appDialog(
          pageChild: AppSimpleDialog(
            title: S.current.passwordChanged,
            message: S.current.yourPasswordHasBeenSuccessfullyUpdated,
            icon: Icon(Icons.check_circle_outline, size: 50, color: AppColorScheme.primarySwatch),
            onOkPressed: () {
              Get.offNamed(Routes.myDevices);
            },
          ),
          barrierDismissible: false);
    } else if (response.status == Status.failed) {
      final error = response.error ?? AppException.generic();
      Get.appDialog(
        pageChild: AppSimpleDialog(
          title: error.title ?? '',
          message: error.description ?? '',
          icon: Icon(Icons.error_outline, size: 50, color: AppColorScheme.error),
          onClosePressed: () {},
        ),
      );
    }
  }
//endregion

}
