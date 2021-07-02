import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/pages/sign_in/model/sign_in_model.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';
import 'package:radio_life/core/domain/use_cases/auth/do_sign_in_use_case.dart';

import '../../helper/dialog_helper.dart';
import '../../radio_life_app_routes.dart';
import 'adapter/sign_in_adapter.dart';

class SignInController extends GetxController {
  SignInController(this._doSignInUseCase);

  //region Use Cases
  final DoSignInUseCase _doSignInUseCase;

  //endregion

  //region State
  Rx<Resource<UserEntity?>> state = Resource.success<UserEntity?>().obs;

  //endregion

  //region Public
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  final signInModel = const SignInModel().obs;

  //endregion

  //region Functions
  Future performSignIn() async {

    Get.offAllNamed(Routes.products);

    /*if (!_isValid) return;

    AppUIBlock.blockUI(context: Get.context);
    final response = await _doSignInUseCase(
      SignInParams(
          email: emailController.text,
        password: pwdController.text
      ),
    );
    AppUIBlock.unblock(context: Get.context);

    if (response.status == Status.success && response.data != null) {
      Get.offAllNamed(Routes.products);
    } else if (response.status == Status.failed) {
      final error = response.error ?? AppException.generic();
      Get.appDialog(
        pageChild: AppSimpleDialog(
          title: error.title ?? '',
          message: error.description ?? '',
          icon: Icon(Icons.error_outline, size: 50, color: AppColorScheme.error),
          onButtonPressed: () {},
        ),
      );
    }*/
  }

  bool get _isValid {
    signInModel.value =
        SignInModel(email: emailController.text, password: pwdController.text).validate;
    return signInModel.value.isValid;
  }
}
