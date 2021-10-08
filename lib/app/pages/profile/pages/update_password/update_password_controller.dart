import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:universal_io/io.dart' as io;
import '../../../../../generated/l10n.dart';

class UpdatePasswordController extends GetxController {
  final TextEditingController currentPasswordController = TextEditingController();
  final FocusNode currentPasswordFocus = FocusNode();
  final TextEditingController newPasswordController = TextEditingController();
  final FocusNode newPasswordFocus = FocusNode();
  final TextEditingController confirmPasswordController = TextEditingController();
  final FocusNode confirmPasswordFocus = FocusNode();

  Rxn<io.File?> image = Rxn<io.File?>();
  Rxn<String?> imageUrl = Rxn<String?>();

  Future updatePassword() async {
    // AppUIBlock.blockUI(context: Get.context);
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar(
        S.of(Get.context as BuildContext).titleUpdatePassword,
        S.of(Get.context as BuildContext).messageUpdatePassword,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        margin: const EdgeInsets.all(16),
        backgroundColor: Colors.redAccent[100],
      );
    }

    // AppUIBlock.unblock(context: Get.context);
  }

  void clear() {
    currentPasswordController.text = '';
    newPasswordController.text = '';
    confirmPasswordController.text = '';
  }
}
