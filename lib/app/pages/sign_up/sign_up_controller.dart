import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/pages/sign_up/model/sign_up_model.dart';
import 'adapter/sign_up_adapter.dart';

class SignUpController extends GetxController {

  //region Private
  //endregion

  //region Public
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final signUpModel = const SignUpModel().obs;
  //endregion

  //region Functions
  void performSignUp(){
    if(!_isValid) return;
    ///ToDo(denis): perform sign up
  }

  bool get _isValid{
    signUpModel.value = SignUpModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: pwdController.text
    ).validate;
    return signUpModel.value.isValid;
  }

  //endregion

}