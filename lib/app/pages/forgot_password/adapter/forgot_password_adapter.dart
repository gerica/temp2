import 'package:radio_life/app/helper/validation_helper.dart';
import 'package:radio_life/app/pages/forgot_password/model/forgort_password_model.dart';

extension ForgotPasswordAdapter on ForgotPasswordModel {
  ForgotPasswordModel get validate => ForgotPasswordModel(
        emailError: ValidationHelper.validateEmail(email),
        isValid: emailError != null,
      );
}
