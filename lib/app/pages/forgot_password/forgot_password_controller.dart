import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/forgot_password/model/forgort_password_model.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/domain/use_cases/auth/reset_password_use_case.dart';
import 'package:radio_life/generated/l10n.dart';

import 'adapter/forgot_password_adapter.dart';

class ForgotPasswordController extends GetxController {
  ForgotPasswordController(this._resetPasswordUseCase);

  //region UseCases
  final ResetPasswordUseCase _resetPasswordUseCase;

  //endregion

  //region Public
  TextEditingController emailController = TextEditingController();
  final forgotPasswordModel = const ForgotPasswordModel().obs;

  //endregion

  //region Functions
  Future performPasswordRecovery() async {
    if (!_isValid) return;

    AppUIBlock.blockUI(context: Get.context);
    final response = await _resetPasswordUseCase(emailController.text);
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        Get.appDialog(
          barrierDismissible: false,
          pageChild: AppSimpleDialog(
            title: S.current.success,
            message: S.current.weSentATemporaryPasswordToYourEmailUseIt,
            icon: Icon(Icons.error_outline, size: 50, color: AppColorScheme.error),
            onClosePressed: () {
              Get.back();
              Get.offNamed(Routes.signIn);
            },
          ),
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

  bool get _isValid {
    forgotPasswordModel.value = ForgotPasswordModel(
      email: emailController.text,
    ).validate;
    return forgotPasswordModel.value.isValid;
  }
}
