import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/validation_helper.dart';

import '../../../../radio_life_app_routes.dart';

class AddNewDeviceController extends GetxController {
  TextEditingController serialNumberController = TextEditingController();
  final FocusNode serialNumberFocus = FocusNode();
  final serialNumberError = ''.obs;
  TextEditingController locationController = TextEditingController();
  final FocusNode locationFocus = FocusNode();
  final locationError = ''.obs;

  void pressContinue() {
    if (!_isValid) return;
    Get.toNamed(Routes.autoScanPage);
  }

  bool get _isValid {
    bool result = true;
    serialNumberError('');
    locationError('');
    final tempSN = ValidationHelper.validateField(serialNumberController.text);
    if (tempSN != null) {
      serialNumberError(tempSN);
      result = false;
    }
    final tempLocation = ValidationHelper.validateField(locationController.text);
    if (tempLocation != null) {
      locationError(tempLocation);
      result = false;
    }
    return result;
  }
}
