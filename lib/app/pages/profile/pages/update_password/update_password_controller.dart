import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/domain/entities/user/user_entity_password.dart';
import 'package:radio_life/core/domain/use_cases/user/update_user_password_use_case.dart';
import 'package:universal_io/io.dart' as io;
import '../../../../../generated/l10n.dart';

class UpdatePasswordController extends GetxController {
  final UpdateUserPasswordUseCase _updateUserPasswordUseCase;

  UpdatePasswordController(this._updateUserPasswordUseCase);

  final TextEditingController currentPasswordController = TextEditingController();
  final FocusNode currentPasswordFocus = FocusNode();
  final TextEditingController newPasswordController = TextEditingController();
  final FocusNode newPasswordFocus = FocusNode();
  final TextEditingController confirmPasswordController = TextEditingController();
  final FocusNode confirmPasswordFocus = FocusNode();

  Rxn<io.File?> image = Rxn<io.File?>();
  Rxn<String?> imageUrl = Rxn<String?>();

  Future updatePassword() async {
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar(
        S.of(Get.context as BuildContext).titleUpdatePassword,
        S.of(Get.context as BuildContext).messageUpdatePassword,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        margin: const EdgeInsets.all(16),
        backgroundColor: Colors.redAccent[100],
      );
      return;
    }
    AppUIBlock.blockUI(context: Get.context);

    final response = await _updateUserPasswordUseCase(
      UserEntityPassword(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      ),
    );

    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        Get.appDialog(
          barrierDismissible: false,
          pageChild: AppSimpleDialog(
            title: S.current.success,
            message: S.current.yourPasswordWasSuccessfullyUpdated,
            icon: Icon(Icons.check_circle_outline, size: 50, color: AppColorScheme.primarySwatch),
            onClosePressed: () {
              Get.back(); // close dialog
              Get.back(); // back page
            },
          ),
        );

        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }

    // Get.snackbar(
    //   'Teste',
    //   'Sucesso',
    //   snackPosition: SnackPosition.BOTTOM,
    //   colorText: Colors.black,
    //   margin: const EdgeInsets.all(16),
    //   backgroundColor: Colors.green[100],
    // );
    // AppUIBlock.unblock(context: Get.context);
  }

  void clear() {
    currentPasswordController.text = '';
    newPasswordController.text = '';
    confirmPasswordController.text = '';
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
