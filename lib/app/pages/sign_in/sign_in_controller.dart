import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/pages/sign_in/model/sign_in_model.dart';
import '../../radio_life_app_routes.dart';
import 'adapter/sign_in_adapter.dart';

class SignInController extends GetxController {

  //region Private
  //endregion

  //region Public
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  final signInModel = const SignInModel().obs;
  //endregion

  //region Functions
  void performSignIn(){
    if(!_isValid) return;
    ///ToDo(denis): perform sign in
    Get.offAllNamed(Routes.home);
  }

  bool get _isValid{
    signInModel.value = SignInModel(
        email: emailController.text,
        password: pwdController.text
    ).validate;
    return signInModel.value.isValid;
  }

}