import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/sign_in/model/sign_in_model.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navitation_bar_controller.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';
import 'package:radio_life/core/domain/use_cases/auth/do_sign_in_use_case.dart';
import 'package:radio_life/core/domain/use_cases/user/save_user_id_use_case.dart';

import 'adapter/sign_in_adapter.dart';

class SignInController extends GetxController {
  SignInController(
    this._doSignInUseCase,
    this._saveUserIdUseCase,
  );

  //region Use Cases
  final DoSignInUseCase _doSignInUseCase;
  final SaveUserIdUseCase _saveUserIdUseCase;

  //endregion

  //region State
  Rx<Resource<UserEntity?>> state = Resource.success<UserEntity?>().obs;

  //endregion

  //region Public
  TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  TextEditingController pwdController = TextEditingController();
  final FocusNode pwdFocus = FocusNode();
  final signInModel = const SignInModel().obs;

  //endregion

  //region Functions
  Future performSignIn() async {
    if (!_isValid) return;

    AppUIBlock.blockUI(context: Get.context);
    final response = await _doSignInUseCase(
      SignInParams(email: emailController.text, password: pwdController.text),
    );
    AppUIBlock.unblock(context: Get.context);
    final data = response.data;
    if (response.status == Status.success && data != null) {
      await _saveUserIdUseCase(data.accountId ?? '');
      if (data.confirmed == true) {
        final bottomNavigationController = Get.find<AppBottomNavigationController>();
        bottomNavigationController.changePage(0);
        Get.offAllNamed(
          Routes.myDevices,
          predicate: ModalRoute.withName('/'),
        );
      } else
        Get.toNamed(Routes.createPassword, preventDuplicates: false);
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

  bool get _isValid {
    signInModel.value = SignInModel(email: emailController.text, password: pwdController.text).validate;
    return signInModel.value.isValid;
  }
}
