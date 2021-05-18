import 'package:flutter/foundation.dart';

@immutable
class SignUpModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? passwordError;
  final bool isValid;

  const SignUpModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.firstNameError,
      this.lastNameError,
      this.emailError,
      this.passwordError,
      this.isValid = false});

  SignUpModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? passwordError,
    bool? isValid,
  }) =>
      SignUpModel(
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          email: email ?? this.email,
          password: password ?? this.password,
          firstNameError: firstNameError ?? this.firstNameError,
          lastNameError: lastNameError ?? this.lastNameError,
          emailError: emailError ?? this.emailError,
          passwordError: passwordError ?? this.passwordError,
          isValid: isValid ?? this.isValid);
}
