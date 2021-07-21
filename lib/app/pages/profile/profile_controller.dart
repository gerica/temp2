import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/core/domain/use_cases/auth/log_out_use_case.dart';

class ProfileController extends GetxController {
  ProfileController(
    this._imagePicker,
    this._logOutUseCase,
  );

  //region Use Cases
  final LogOutUseCase _logOutUseCase;

  //endregion

  //region Variables
  final TextEditingController firstNameController =
      TextEditingController(text: 'Denis');
  final TextEditingController lastNameController =
      TextEditingController(text: 'Costa');
  final ImagePicker _imagePicker;
  Rx<File?> image = Rxn<File>();
  File? file;

  //endregion

  //region Functions
  Future getImage(ImageSource source) async {
    final pickedFile = await _imagePicker.getImage(
        source: source,
        preferredCameraDevice: CameraDevice.rear,
        imageQuality: 90,
        maxHeight: 500,
        maxWidth: 500);
    if (pickedFile != null) {
      file = image.value;
      image.value = File(pickedFile.path);
    }
  }

  Future logout() async {
    await _logOutUseCase();
    Get.offAllNamed(Routes.signIn, predicate: ModalRoute.withName('/'));
  }

//endregion

}
