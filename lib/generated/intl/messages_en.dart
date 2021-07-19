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

  static String m0(amount) => "Amount paid ${amount}";

  static String m1(number) => "You have ${number} Credits available";

  static String m2(date) => "Date of purchase ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "amountPaid": m0,
        "autoScan": MessageLookupByLibrary.simpleMessage("Auto Scan"),
        "backToMyDevices":
            MessageLookupByLibrary.simpleMessage("Back to My Devices"),
        "bluetoothDesativado":
            MessageLookupByLibrary.simpleMessage("Bluetooth disabled."),
        "buyCredits": MessageLookupByLibrary.simpleMessage("Buy credits"),
        "buyNow": MessageLookupByLibrary.simpleMessage("Buy now"),
        "camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "configureWifi":
            MessageLookupByLibrary.simpleMessage("Configure Wi-Fi"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmNewDevice":
            MessageLookupByLibrary.simpleMessage("Confirm new device"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "continue_label": MessageLookupByLibrary.simpleMessage("Continue"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Create an account"),
        "creditsCounter": m1,
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("Current Password"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "dateOfPurchase": m2,
        "datePicker": MessageLookupByLibrary.simpleMessage("Date picker"),
        "deviceFound": MessageLookupByLibrary.simpleMessage("Device found"),
        "devices": MessageLookupByLibrary.simpleMessage("Devices"),
        "downloadManual":
            MessageLookupByLibrary.simpleMessage("Download Manual"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "enableBluetoothMessage": MessageLookupByLibrary.simpleMessage(
            "Before continuing, please enable your mobile\'s bluetooth so that we can find your device."),
        "faqUpperCase": MessageLookupByLibrary.simpleMessage("FAQ"),
        "firstName": MessageLookupByLibrary.simpleMessage("First name"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "forgotPasswordUpperCase":
            MessageLookupByLibrary.simpleMessage("FORGOT PASSWORD"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "haveAnAccountSignIn":
            MessageLookupByLibrary.simpleMessage("Have an account? Sign In!"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello,"),
        "howCanIAddADevice":
            MessageLookupByLibrary.simpleMessage("How can I add a device?"),
        "howDoIAddMoreCredits":
            MessageLookupByLibrary.simpleMessage("How do I add more credits?"),
        "isItPossibleToSeeMyResults": MessageLookupByLibrary.simpleMessage(
            "Is it possible to see my results?"),
        "joinUs": MessageLookupByLibrary.simpleMessage("Join us"),
        "key": MessageLookupByLibrary.simpleMessage("value"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last name"),
        "location": MessageLookupByLibrary.simpleMessage("Location"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loremIpsum": MessageLookupByLibrary.simpleMessage(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
        "myDevice": MessageLookupByLibrary.simpleMessage("My Device"),
        "myDevices": MessageLookupByLibrary.simpleMessage("My Devices"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "newDevice": MessageLookupByLibrary.simpleMessage("New Device"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "noBluetoothDeviceFound":
            MessageLookupByLibrary.simpleMessage("No bluetooth device found"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "orderDetails": MessageLookupByLibrary.simpleMessage("Order details"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "pleaseConnectToAWifiNetworkToContinue":
            MessageLookupByLibrary.simpleMessage(
                "Please connect to a WiFi network to continue."),
        "products": MessageLookupByLibrary.simpleMessage("Products"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "purchaseCompleted":
            MessageLookupByLibrary.simpleMessage("Purchase completed"),
        "qrCode": MessageLookupByLibrary.simpleMessage("QR CODE"),
        "radiolifeco": MessageLookupByLibrary.simpleMessage("Radiolife.co"),
        "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
        "reports": MessageLookupByLibrary.simpleMessage("Reports"),
        "requiredField": MessageLookupByLibrary.simpleMessage("Required field"),
        "reset": MessageLookupByLibrary.simpleMessage("RESET"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "searchDevices": MessageLookupByLibrary.simpleMessage("Search Devices"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "sendEmailUpperCase":
            MessageLookupByLibrary.simpleMessage("SEND E-MAIL"),
        "serialNumber": MessageLookupByLibrary.simpleMessage("Serial Number"),
        "signIn": MessageLookupByLibrary.simpleMessage("SIGN IN"),
        "signInCamelCase": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signUpCamelCase": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "signinInstead":
            MessageLookupByLibrary.simpleMessage("Sign-in instead"),
        "signup": MessageLookupByLibrary.simpleMessage("SIGN UP"),
        "stillNeedHelpSendUsAMessage": MessageLookupByLibrary.simpleMessage(
            "Still need help? Send us a message!"),
        "success": MessageLookupByLibrary.simpleMessage("Success"),
        "support": MessageLookupByLibrary.simpleMessage("Support"),
        "temporaryPassword":
            MessageLookupByLibrary.simpleMessage("Temporary Password"),
        "tests": MessageLookupByLibrary.simpleMessage("Tests"),
        "theEnteredEmailIsNotValid": MessageLookupByLibrary.simpleMessage(
            "The entered email is not valid"),
        "updatePassword":
            MessageLookupByLibrary.simpleMessage("Update password"),
        "weSentATemporaryPasswordToYourEmailUseIt":
            MessageLookupByLibrary.simpleMessage(
                "We sent a temporary password to your email. Use it to sign in the app."),
        "wifiRequired": MessageLookupByLibrary.simpleMessage("WiFi Required"),
        "wifiSsid": MessageLookupByLibrary.simpleMessage("WiFi SSID"),
        "yourMessage": MessageLookupByLibrary.simpleMessage("Your Message"),
        "yourPasswordMustHaveAtLeast6Characters":
            MessageLookupByLibrary.simpleMessage(
                "Your password must have at least 6 characters")
      };
}
