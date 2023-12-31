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

  /// `Join us`
  String get joinUs {
    return Intl.message(
      'Join us',
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

  /// `SEND E-MAIL`
  String get sendEmailUpperCase {
    return Intl.message(
      'SEND E-MAIL',
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

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.`
  String get loremIpsum {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      name: 'loremIpsum',
      desc: '',
      args: [],
    );
  }

  /// `Download Manual`
  String get downloadManual {
    return Intl.message(
      'Download Manual',
      name: 'downloadManual',
      desc: '',
      args: [],
    );
  }

  /// `Buy now`
  String get buyNow {
    return Intl.message(
      'Buy now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAnAccount {
    return Intl.message(
      'Create an account',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpCamelCase {
    return Intl.message(
      'Sign Up',
      name: 'signUpCamelCase',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signInCamelCase {
    return Intl.message(
      'Sign In',
      name: 'signInCamelCase',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Have an account? Sign In!`
  String get haveAnAccountSignIn {
    return Intl.message(
      'Have an account? Sign In!',
      name: 'haveAnAccountSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Update password`
  String get updatePassword {
    return Intl.message(
      'Update password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Date picker`
  String get datePicker {
    return Intl.message(
      'Date picker',
      name: 'datePicker',
      desc: '',
      args: [],
    );
  }

  /// `Tests`
  String get tests {
    return Intl.message(
      'Tests',
      name: 'tests',
      desc: '',
      args: [],
    );
  }

  /// `Devices`
  String get devices {
    return Intl.message(
      'Devices',
      name: 'devices',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Device`
  String get newDevice {
    return Intl.message(
      'New Device',
      name: 'newDevice',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Serial Number`
  String get serialNumber {
    return Intl.message(
      'Serial Number',
      name: 'serialNumber',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new device`
  String get confirmNewDevice {
    return Intl.message(
      'Confirm new device',
      name: 'confirmNewDevice',
      desc: '',
      args: [],
    );
  }

  /// `QR CODE`
  String get qrCode {
    return Intl.message(
      'QR CODE',
      name: 'qrCode',
      desc: '',
      args: [],
    );
  }

  /// `Temporary Password`
  String get temporaryPassword {
    return Intl.message(
      'Temporary Password',
      name: 'temporaryPassword',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `We sent a temporary password to your email. Use it to sign in the app.`
  String get weSentATemporaryPasswordToYourEmailUseIt {
    return Intl.message(
      'We sent a temporary password to your email. Use it to sign in the app.',
      name: 'weSentATemporaryPasswordToYourEmailUseIt',
      desc: '',
      args: [],
    );
  }

  /// `My Device`
  String get myDevice {
    return Intl.message(
      'My Device',
      name: 'myDevice',
      desc: '',
      args: [],
    );
  }

  /// `Buy credits`
  String get buyCredits {
    return Intl.message(
      'Buy credits',
      name: 'buyCredits',
      desc: '',
      args: [],
    );
  }

  /// `You have {number} Credits available`
  String creditsCounter(Object number) {
    return Intl.message(
      'You have $number Credits available',
      name: 'creditsCounter',
      desc: '',
      args: [number],
    );
  }

  /// `Purchase completed`
  String get purchaseCompleted {
    return Intl.message(
      'Purchase completed',
      name: 'purchaseCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Order details`
  String get orderDetails {
    return Intl.message(
      'Order details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Radiolife.co`
  String get radiolifeco {
    return Intl.message(
      'Radiolife.co',
      name: 'radiolifeco',
      desc: '',
      args: [],
    );
  }

  /// `Date of purchase {date}`
  String dateOfPurchase(Object date) {
    return Intl.message(
      'Date of purchase $date',
      name: 'dateOfPurchase',
      desc: '',
      args: [date],
    );
  }

  /// `Amount paid {amount}`
  String amountPaid(Object amount) {
    return Intl.message(
      'Amount paid $amount',
      name: 'amountPaid',
      desc: '',
      args: [amount],
    );
  }

  /// `Back to My Devices`
  String get backToMyDevices {
    return Intl.message(
      'Back to My Devices',
      name: 'backToMyDevices',
      desc: '',
      args: [],
    );
  }

  /// `Auto Scan`
  String get autoScan {
    return Intl.message(
      'Auto Scan',
      name: 'autoScan',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth disabled.`
  String get bluetoothDesativado {
    return Intl.message(
      'Bluetooth disabled.',
      name: 'bluetoothDesativado',
      desc: '',
      args: [],
    );
  }

  /// `Before continuing, please enable your mobile's bluetooth so that we can find your device.`
  String get enableBluetoothMessage {
    return Intl.message(
      'Before continuing, please enable your mobile\'s bluetooth so that we can find your device.',
      name: 'enableBluetoothMessage',
      desc: '',
      args: [],
    );
  }

  /// `No bluetooth device found`
  String get noBluetoothDeviceFound {
    return Intl.message(
      'No bluetooth device found',
      name: 'noBluetoothDeviceFound',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_label {
    return Intl.message(
      'Continue',
      name: 'continue_label',
      desc: '',
      args: [],
    );
  }

  /// `Device found`
  String get deviceFound {
    return Intl.message(
      'Device found',
      name: 'deviceFound',
      desc: '',
      args: [],
    );
  }

  /// `Search Devices`
  String get searchDevices {
    return Intl.message(
      'Search Devices',
      name: 'searchDevices',
      desc: '',
      args: [],
    );
  }

  /// `Configure Wi-Fi`
  String get configureWifi {
    return Intl.message(
      'Configure Wi-Fi',
      name: 'configureWifi',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `WiFi SSID`
  String get wifiSsid {
    return Intl.message(
      'WiFi SSID',
      name: 'wifiSsid',
      desc: '',
      args: [],
    );
  }

  /// `WiFi Required`
  String get wifiRequired {
    return Intl.message(
      'WiFi Required',
      name: 'wifiRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please connect to a WiFi network to continue.`
  String get pleaseConnectToAWifiNetworkToContinue {
    return Intl.message(
      'Please connect to a WiFi network to continue.',
      name: 'pleaseConnectToAWifiNetworkToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Password changed`
  String get passwordChanged {
    return Intl.message(
      'Password changed',
      name: 'passwordChanged',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been successfully updated.`
  String get yourPasswordHasBeenSuccessfullyUpdated {
    return Intl.message(
      'Your password has been successfully updated.',
      name: 'yourPasswordHasBeenSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Your profile was successfully updated`
  String get yourProfileWasSuccessfullyUpdated {
    return Intl.message(
      'Your profile was successfully updated',
      name: 'yourProfileWasSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `You have no devices.`
  String get youHaveNoDevices {
    return Intl.message(
      'You have no devices.',
      name: 'youHaveNoDevices',
      desc: '',
      args: [],
    );
  }

  /// `Register new device`
  String get registerNewDevice {
    return Intl.message(
      'Register new device',
      name: 'registerNewDevice',
      desc: '',
      args: [],
    );
  }

  /// `{quantity} credits`
  String creditsQuantity(Object quantity) {
    return Intl.message(
      '$quantity credits',
      name: 'creditsQuantity',
      desc: '',
      args: [quantity],
    );
  }

  /// `Error`
  String get titleUpdatePassword {
    return Intl.message(
      'Error',
      name: 'titleUpdatePassword',
      desc: '',
      args: [],
    );
  }

  /// `new password and confirm password need to be equals`
  String get messageUpdatePassword {
    return Intl.message(
      'new password and confirm password need to be equals',
      name: 'messageUpdatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Your password was successfully changed`
  String get yourPasswordWasSuccessfullyUpdated {
    return Intl.message(
      'Your password was successfully changed',
      name: 'yourPasswordWasSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure, you want to register Cube {serialNmber} to you account?`
  String titleConfirmRegisterDevice(Object serialNmber) {
    return Intl.message(
      'Are you sure, you want to register Cube $serialNmber to you account?',
      name: 'titleConfirmRegisterDevice',
      desc: '',
      args: [serialNmber],
    );
  }

  /// `This cube will be configured to you, not would be configured again.`
  String get textConfirmRegisterDevice {
    return Intl.message(
      'This cube will be configured to you, not would be configured again.',
      name: 'textConfirmRegisterDevice',
      desc: '',
      args: [],
    );
  }

  /// `Type the name of device.`
  String get textConfirmRegisterDeviceName {
    return Intl.message(
      'Type the name of device.',
      name: 'textConfirmRegisterDeviceName',
      desc: '',
      args: [],
    );
  }

  /// `Register device`
  String get btnRegister {
    return Intl.message(
      'Register device',
      name: 'btnRegister',
      desc: '',
      args: [],
    );
  }

  /// `Empty list`
  String get emptyList {
    return Intl.message(
      'Empty list',
      name: 'emptyList',
      desc: '',
      args: [],
    );
  }

  /// `You have no reports`
  String get youHaveNoReports {
    return Intl.message(
      'You have no reports',
      name: 'youHaveNoReports',
      desc: '',
      args: [],
    );
  }

  /// `Positive`
  String get positive {
    return Intl.message(
      'Positive',
      name: 'positive',
      desc: '',
      args: [],
    );
  }

  /// `Negative`
  String get negative {
    return Intl.message(
      'Negative',
      name: 'negative',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Don't have more exams`
  String get noMoreExams {
    return Intl.message(
      'Don\'t have more exams',
      name: 'noMoreExams',
      desc: '',
      args: [],
    );
  }

  /// `Exam`
  String get textExam {
    return Intl.message(
      'Exam',
      name: 'textExam',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get textStatus {
    return Intl.message(
      'Status',
      name: 'textStatus',
      desc: '',
      args: [],
    );
  }

  /// `Please see a doctor.`
  String get textResultPositive {
    return Intl.message(
      'Please see a doctor.',
      name: 'textResultPositive',
      desc: '',
      args: [],
    );
  }

  /// `All right with you.`
  String get textResultNegative {
    return Intl.message(
      'All right with you.',
      name: 'textResultNegative',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get textDevice {
    return Intl.message(
      'Device',
      name: 'textDevice',
      desc: '',
      args: [],
    );
  }

  /// `Details exam`
  String get titleReportDetails {
    return Intl.message(
      'Details exam',
      name: 'titleReportDetails',
      desc: '',
      args: [],
    );
  }

  /// `The list of devices was update!`
  String get updateMyDevices {
    return Intl.message(
      'The list of devices was update!',
      name: 'updateMyDevices',
      desc: '',
      args: [],
    );
  }

  /// `Success to by credit`
  String get orderDetailsText {
    return Intl.message(
      'Success to by credit',
      name: 'orderDetailsText',
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
