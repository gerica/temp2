import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/data/model/app_exception.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/data/repositories/auth/auth_repository.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/sign_up/model/sign_up_model.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';

import 'package:radio_life/generated/l10n.dart';
import 'adapter/sign_up_adapter.dart';

class SignUpController extends GetxController {
  final _authRepository = AuthRepository();

  Rx<Resource<String?>> state = Resource.success<String?>().obs;
  final ready = false.obs;

  final TextEditingController firstNameController = TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final TextEditingController lastNameController = TextEditingController();
  final FocusNode lastNameFocus = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();

  final signUpModel = const SignUpModel().obs;

  @override
  Future onInit() async {
    if (await isUserLogIn() && await _authRepository.getUserConfirmedValue)
      Get.offNamed(Routes.myDevices);
    else
      ready.value = true;
    super.onInit();
  } //endregion

  Future<bool> isUserLogIn() async {
    final token = kIsWeb ? _authRepository.getTokenFromLocalStorage : await _authRepository.getToken;
    return token != null && token.isNotEmpty;
  }

  //region Functions

  Future performSignUp() async {
    _isValid;
    if (firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty && emailController.text.isNotEmpty) {
      AppUIBlock.blockUI(context: Get.context);
      final response = await _authRepository.signUp(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
      );
      AppUIBlock.unblock(context: Get.context);

      if (response.status == Status.success && response.data != null) {
        Get.appDialog(
          pageChild: AppSimpleDialog(
            title: S.current.success,
            message: S.current.weSentATemporaryPasswordToYourEmailUseIt,
            icon: Icon(Icons.check_circle_outline, size: 50, color: AppColorScheme.primarySwatch),
            onClosePressed: () {},
          ),
        );
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
  }

  bool get _isValid {
    signUpModel.value =
        SignUpModel(firstName: firstNameController.text, lastName: lastNameController.text, email: emailController.text)
            .validate;
    return signUpModel.value.isValid;
  }

//endregion

}
