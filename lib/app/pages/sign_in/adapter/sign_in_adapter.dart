import 'package:radio_life/app/pages/sign_in/model/sign_in_model.dart';

extension SignInAdapter on SignInModel {
  SignInModel get validate => SignInModel(
        emailError: null,//ValidationHelper.validateEmail(email),
        passwordError: null,//ValidationHelper.validateField(password),
        isValid: emailError == null && passwordError == null,
      );
}
