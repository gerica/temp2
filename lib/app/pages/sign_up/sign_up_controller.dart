import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/pages/sign_up/model/sign_up_model.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/use_cases/auth/check_if_has_user_logged_in_use_case.dart';
import 'package:radio_life/core/domain/use_cases/auth/check_if_user_was_confirmed.dart';
import 'package:radio_life/core/domain/use_cases/auth/do_sign_up_use_case.dart';

import '../../../generated/l10n.dart';
import '../../helper/dialog_helper.dart';
import 'adapter/sign_up_adapter.dart';

class SignUpController extends GetxController {
  SignUpController(
    this._doSignUpUseCase,
    this._userIsLoggedIn,
    this._checkIfUserWasConfirmed,
  );

  //region Use Cases
  final DoSignUpUseCase _doSignUpUseCase;
  final CheckIfUserIsLoggedInUseCase _userIsLoggedIn;
  final CheckIfUserWasConfirmed _checkIfUserWasConfirmed;

  //endregion

  //region State
  //region State
  Rx<Resource<String?>> state = Resource.success<String?>().obs;
  final ready = false.obs;

  //endregion
  //endregion

  //region Public
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final signUpModel = const SignUpModel().obs;

  @override
  Future onInit() async {
    if (await _userIsLoggedIn() && await _checkIfUserWasConfirmed())
      Get.offNamed(Routes.products);
    else
      ready.value = true;
    super.onInit();
  } //endregion

  //region Functions

  Future performSignUp() async {
    _isValid;
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      AppUIBlock.blockUI(context: Get.context);
      final response = await _doSignUpUseCase(
        SignUpParams(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text),
      );
      AppUIBlock.unblock(context: Get.context);

      if (response.status == Status.success && response.data != null) {
        Get.appDialog(
          pageChild: AppSimpleDialog(
            title: S.current.success,
            message: S.current.weSentATemporaryPasswordToYourEmailUseIt,
            icon: Icon(Icons.check_circle_outline,
                size: 50, color: AppColorScheme.primarySwatch),
            onClosePressed: () {},
          ),
        );
      } else if (response.status == Status.failed) {
        final error = response.error ?? AppException.generic();
        Get.appDialog(
          pageChild: AppSimpleDialog(
            title: error.title ?? '',
            message: error.description ?? '',
            icon: Icon(Icons.error_outline,
                size: 50, color: AppColorScheme.error),
            onClosePressed: () {},
          ),
        );
      }
    }
  }

  bool get _isValid {
    signUpModel.value = SignUpModel(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            password: pwdController.text)
        .validate;
    return signUpModel.value.isValid;
  }

//endregion

}
