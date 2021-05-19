import 'package:radio_life/app/helper/validation_helper.dart';
import 'package:radio_life/app/pages/sign_in/model/sign_in_model.dart';

extension SignInAdapter on SignInModel {
  SignInModel get validate => SignInModel(
        emailError: ValidationHelper.validateEmail(email),
        passwordError: ValidationHelper.validateField(password),
        isValid: emailError != null && passwordError != null,
      );
}
