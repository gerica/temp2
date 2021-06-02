// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `value`
  String get key {
    return Intl.message(
      'value',
      name: 'key',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get signIn {
    return Intl.message(
      'SIGN IN',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Join US`
  String get joinUs {
    return Intl.message(
      'Join US',
      name: 'joinUs',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign-in instead`
  String get signinInstead {
    return Intl.message(
      'Sign-in instead',
      name: 'signinInstead',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get signup {
    return Intl.message(
      'SIGN UP',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `RESET`
  String get reset {
    return Intl.message(
      'RESET',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `SEND EMAIL`
  String get sendEmailUpperCase {
    return Intl.message(
      'SEND EMAIL',
      name: 'sendEmailUpperCase',
      desc: '',
      args: [],
    );
  }

  /// `FORGOT PASSWORD`
  String get forgotPasswordUpperCase {
    return Intl.message(
      'FORGOT PASSWORD',
      name: 'forgotPasswordUpperCase',
      desc: '',
      args: [],
    );
  }

  /// `Required field`
  String get requiredField {
    return Intl.message(
      'Required field',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `The entered email is not valid`
  String get theEnteredEmailIsNotValid {
    return Intl.message(
      'The entered email is not valid',
      name: 'theEnteredEmailIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Your password must have at least 6 characters`
  String get yourPasswordMustHaveAtLeast6Characters {
    return Intl.message(
      'Your password must have at least 6 characters',
      name: 'yourPasswordMustHaveAtLeast6Characters',
      desc: '',
      args: [],
    );
  }

  /// `Hello,`
  String get hello {
    return Intl.message(
      'Hello,',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `My Devices`
  String get myDevices {
    return Intl.message(
      'My Devices',
      name: 'myDevices',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faqUpperCase {
    return Intl.message(
      'FAQ',
      name: 'faqUpperCase',
      desc: '',
      args: [],
    );
  }

  /// `How do I add more credits?`
  String get howDoIAddMoreCredits {
    return Intl.message(
      'How do I add more credits?',
      name: 'howDoIAddMoreCredits',
      desc: '',
      args: [],
    );
  }

  /// `How can I add a device?`
  String get howCanIAddADevice {
    return Intl.message(
      'How can I add a device?',
      name: 'howCanIAddADevice',
      desc: '',
      args: [],
    );
  }

  /// `Is it possible to see my results?`
  String get isItPossibleToSeeMyResults {
    return Intl.message(
      'Is it possible to see my results?',
      name: 'isItPossibleToSeeMyResults',
      desc: '',
      args: [],
    );
  }

  /// `Still need help? Send us a message!`
  String get stillNeedHelpSendUsAMessage {
    return Intl.message(
      'Still need help? Send us a message!',
      name: 'stillNeedHelpSendUsAMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your Message`
  String get yourMessage {
    return Intl.message(
      'Your Message',
      name: 'yourMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
