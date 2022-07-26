import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/data/model/app_exception.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';

class BaseController extends GetxController {
  void handleError(AppException error, {bool actionBack = true}) {
    if (error.description == 'Please Login Again!') {
      Get.offAllNamed(Routes.signIn);
    }
    Get.appDialog(
      barrierDismissible: false,
      pageChild: AppSimpleDialog(
        title: error.title ?? '',
        message: error.description ?? '',
        icon: Icon(Icons.error_outline, size: 50, color: AppColorScheme.error),
        onClosePressed: () {
          if (actionBack) {
            Get.back();
          }
        },
      ),
    );
  }
}
