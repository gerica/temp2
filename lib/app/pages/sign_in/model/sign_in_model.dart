import 'package:flutter/foundation.dart';

@immutable
class SignInModel {
  final String? email;
  final String? password;
  final String? emailError;
  final String? passwordError;
  final bool isValid;

  const SignInModel(
      {
      this.email,
      this.password,
      this.emailError,
      this.passwordError,
      this.isValid = false});

  SignInModel copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    bool? isValid,
  }) =>
      SignInModel(
          email: email ?? this.email,
          password: password ?? this.password,
          emailError: emailError ?? this.emailError,
          passwordError: passwordError ?? this.passwordError,
          isValid: isValid ?? this.isValid);
}
