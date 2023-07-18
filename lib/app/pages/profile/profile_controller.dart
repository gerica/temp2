import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/data/model/app_exception.dart';
import 'package:radio_life/app/data/repositories/auth/auth_repository.dart';
import 'package:radio_life/app/data/repositories/user/user_repository.dart';
import 'package:radio_life/app/domain/entities/user/user_entity.dart';
import 'package:radio_life/app/domain/managers/user_manager.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/base_controller.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/generated/l10n.dart';
import 'package:universal_io/io.dart' as io;

import 'pages/update_password/update_password_controller.dart';

class ProfileController extends BaseController {
  static Future<ProfileController> get to async =>
      Get.isRegistered<ProfileController>() ? Get.find<ProfileController>() : Get.put(ProfileController());

  final _userRepository = UserRepository();
  final _authRepository = AuthRepository();
  final _userManager = UserManager();

  final TextEditingController firstNameController = TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final TextEditingController lastNameController = TextEditingController();
  final FocusNode lastNameFocus = FocusNode();

  final image = Rxn<io.File?>();
  final imageUrl = Rxn<String?>();
  late String _id;
  io.File? file;

  @override
  void onReady() {
    super.onReady();
    _getUserProfile();
  } //endregion

  //region Functions

  Future _getUserProfile() async {
    AppUIBlock.blockUI(context: Get.context);
    final userId = await _userRepository.getUserId();
    _id = userId.data ?? '';
    final response = await _userRepository.getUser(id: _id);
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        final data = response.data;
        if (data != null) {
          firstNameController.text = data.firstNameStr;
          lastNameController.text = data.lastNameStr;
          imageUrl.value = data.image;
        }
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
  }

  Future updateUserProfile() async {
    AppUIBlock.blockUI(context: Get.context);
    final file = this.file;
    final base64 = file != null ? await _userRepository.convertoToBase64(file) : null;
    final response = await _userRepository.updateUserProfile(
      user: UserEntity(
        id: _id,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        image: base64,
      ),
    );
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        Get.appDialog(
          barrierDismissible: false,
          pageChild: AppSimpleDialog(
            title: S.current.success,
            message: S.current.yourProfileWasSuccessfullyUpdated,
            icon: Icon(Icons.check_circle_outline, size: 50, color: AppColorScheme.primarySwatch),
            onClosePressed: () {
              Get.back();
            },
          ),
        );
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
  }

  Future getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: source, preferredCameraDevice: CameraDevice.rear, imageQuality: 90, maxHeight: 500, maxWidth: 500);
    if (pickedFile != null) {
      file = io.File(pickedFile.path);
      image.value = file;
    }
  }

  Future logout() async {
    _userManager.setLoggedIn(isLoggedIn: false);
    _authRepository.logout;
    Get.offAllNamed(Routes.signIn);
  }

  void goPageChangePassword() {
    final contPage = UpdatePasswordController();
    contPage.image = image;
    contPage.imageUrl = imageUrl;
    contPage.clear();
    Get.lazyPut(() => contPage);
    Get.toNamed(Routes.updatePassword);
  }

//endregion
}
