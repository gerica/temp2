import 'package:radio_life/app/helper/validation_helper.dart';
import 'package:radio_life/app/pages/sign_up/model/sign_up_model.dart';

extension SignUpAdapter on SignUpModel {
  SignUpModel get validate => SignUpModel(
        firstNameError: ValidationHelper.validateField(firstName),
        lastNameError: ValidationHelper.validateField(lastName),
        emailError: ValidationHelper.validateEmail(email),
        passwordError: ValidationHelper.validatePassword(password),
        isValid: firstNameError != null &&
            lastNameError != null &&
            emailError != null &&
            passwordError != null,
      );
}
