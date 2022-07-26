import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/data/model/app_exception.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/data/repositories/auth/auth_repository.dart';
import 'package:radio_life/app/data/repositories/user/user_repository.dart';
import 'package:radio_life/app/domain/entities/user/user_entity.dart';
import 'package:radio_life/app/domain/managers/user_manager.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/sign_in/model/sign_in_model.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navitation_bar_controller.dart';

import 'adapter/sign_in_adapter.dart';

class SignInController extends GetxController {
  final _authRepository = AuthRepository();
  final _userManager = UserManager();
  final _userRepository = UserRepository();

  Rx<Resource<UserEntity?>> state = Resource.success<UserEntity?>().obs;

  //endregion

  //region Public
  TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  TextEditingController pwdController = TextEditingController();
  final FocusNode pwdFocus = FocusNode();
  final signInModel = const SignInModel().obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   emailController.text = 'rogerio@radiolifelabs.com';
  //   pwdController.text = '123';
  // }
  //endregion

  //region Functions
  Future performSignIn() async {
    if (!_isValid) return;

    AppUIBlock.blockUI(context: Get.context);

    final response = await _authRepository.signIn(email: emailController.text, password: pwdController.text);

    if (response.status == Status.success && response.data != null) {
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

      // final response = await _doSignInUseCase(
      //   SignInParams(email: emailController.text, password: pwdController.text),
      // );

      AppUIBlock.unblock(context: Get.context);
      // final data = response.data;
      // if (response.status == Status.success && data != null) {
      await _userRepository.saveUserId(id: authEntity?.accountId ?? '');
      if (authEntity?.confirmed == true) {
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
