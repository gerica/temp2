// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "firstName": MessageLookupByLibrary.simpleMessage("First name"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "forgotPasswordUpperCase":
            MessageLookupByLibrary.simpleMessage("FORGOT PASSWORD"),
        "joinUs": MessageLookupByLibrary.simpleMessage("JOIN US"),
        "key": MessageLookupByLibrary.simpleMessage("value"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last name"),
        "login": MessageLookupByLibrary.simpleMessage("LOGIN"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "requiredField": MessageLookupByLibrary.simpleMessage("Required field"),
        "reset": MessageLookupByLibrary.simpleMessage("RESET"),
        "signinInstead":
            MessageLookupByLibrary.simpleMessage("Sign-in instead"),
        "signup": MessageLookupByLibrary.simpleMessage("SIGNUP"),
        "theEnteredEmailIsNotValid": MessageLookupByLibrary.simpleMessage(
            "The entered email is not valid"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("WELCOME BACK"),
        "yourPasswordMustHaveAtLeast6Characters":
            MessageLookupByLibrary.simpleMessage(
                "Your password must have at least 6 characters")
      };
}
