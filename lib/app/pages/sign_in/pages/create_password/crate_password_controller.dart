import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/repositories/auth/auth_repository.dart';
import 'package:radio_life/core/domain/managers/user_manager.dart';

import 'package:radio_life/generated/l10n.dart';

class CreatePasswordController extends GetxController {
  final _authRepository = AuthRepository();
  final _userManager = UserManager();
  final TextEditingController temporaryPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future performChangePassword() async {
    AppUIBlock.blockUI(context: Get.context);

    final response = await _authRepository.changePassword(
      currentPassword: temporaryPasswordController.text,
      newPassword: newPasswordController.text,
    );

    if (response.status == Status.success) {
      final authEntity = response.data;
      if (authEntity != null) {
        if (kIsWeb) {
          await _authRepository.saveTokenAtLocalStorage(token: authEntity.token ?? '');
          await _authRepository.saveUserConfirmedValue(confirmed: authEntity.confirmed ?? false);
        } else
          await _authRepository.setDataAuthLocal(authEntity);

        _userManager.setLoggedIn(
          isLoggedIn: authEntity.token != null && authEntity.confirmed == true,
        );
      }
    }

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
