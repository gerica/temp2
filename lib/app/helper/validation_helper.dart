import '../../generated/l10n.dart';

abstract class ValidationHelper {
  static bool hasUppercase(String text) {
    const r = r'[A-Z]';
    return RegExp(r).hasMatch(text);
  }

  static bool hasDigits(String text) {
    const r = r'[0-9]';
    return RegExp(r).hasMatch(text);
  }

  static bool hasLowercase(String text) {
    const r = r'[a-z]';
    return RegExp(r).hasMatch(text);
  }

  static bool hasSpecialCharacters(String text) =>
      text.contains(RegExp(r""".*[!@#$&*^_`{|}~%'()+,-.\/:;<=>?]"""));

  static bool emailIsValid(String text) {
    const r =
    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    return RegExp(r).hasMatch(text);
  }

  static bool passwordIsValid(String text) => text.length >= 6;

  static String? validateField(String? text){
    if(text == null || text.isEmpty)
      return S.current.requiredField;
    return null;
  }

  static String? validatePassword(String? text){
    if(text == null || text.isEmpty)
      return S.current.requiredField;
    else if(!passwordIsValid(text))
      return S.current.yourPasswordMustHaveAtLeast6Characters;
    return null;
  }

  static String? validateEmail(String? text){
    if(text == null || text.isEmpty)
      return 'Required field';
    else if(!emailIsValid(text))
      return S.current.theEnteredEmailIsNotValid;
    return null;
  }

}