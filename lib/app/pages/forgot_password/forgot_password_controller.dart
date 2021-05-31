import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/pages/forgot_password/model/forgort_password_model.dart';
import 'adapter/forgot_password_adapter.dart';

class ForgotPasswordController extends GetxController {

  //region Private
  //endregion

  //region Public
  TextEditingController emailController = TextEditingController();
  final forgotPasswordModel = const ForgotPasswordModel().obs;
  //endregion

  //region Functions
  void performPasswordRecovery(){
    if(!_isValid) return;
    ///ToDo(denis): perform password recovery
  }

  bool get _isValid{
    forgotPasswordModel.value = ForgotPasswordModel(
        email: emailController.text,
    ).validate;
    return forgotPasswordModel.value.isValid;
  }

}