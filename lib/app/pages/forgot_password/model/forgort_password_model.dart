import 'package:flutter/foundation.dart';

@immutable
class ForgotPasswordModel {
  final String? email;
  final String? emailError;
  final bool isValid;

  const ForgotPasswordModel({this.email, this.emailError, this.isValid = false});

  ForgotPasswordModel copyWith({
    String? email,
    String? emailError,
    bool? isValid,
  }) =>
      ForgotPasswordModel(
          email: email ?? this.email,
          emailError: emailError ?? this.emailError,
          isValid: isValid ?? this.isValid);
}
