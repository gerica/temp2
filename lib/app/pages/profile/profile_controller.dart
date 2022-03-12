import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/base_controller.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';
import 'package:radio_life/core/domain/use_cases/auth/log_out_use_case.dart';
import 'package:radio_life/core/domain/use_cases/user/get_user_id_use_case.dart';
import 'package:radio_life/core/domain/use_cases/user/get_user_profile_use_case.dart';
import 'package:radio_life/core/domain/use_cases/user/image_to_base64_use_case.dart';
import 'package:radio_life/core/domain/use_cases/user/update_user_profile_use_case.dart';
import 'package:radio_life/generated/l10n.dart';
import 'package:universal_io/io.dart' as io;

class ProfileController extends BaseController {
  ProfileController(
    this._imagePicker,
    this._logOutUseCase,
    this._updateUserProfileUseCase,
    this._getUserIdUseCase,
    this._getUserProfileUseCase,
    this._imageToBase64UseCase,
  );

  //region Use Cases
  final LogOutUseCase _logOutUseCase;
  final GetUserProfileUseCase _getUserProfileUseCase;
  final UpdateUserProfileUseCase _updateUserProfileUseCase;
  final GetUserIdUseCase _getUserIdUseCase;
  final ImageToBase64UseCase _imageToBase64UseCase;

  //endregion

  //region Variables
  final TextEditingController firstNameController = TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final TextEditingController lastNameController = TextEditingController();
  final FocusNode lastNameFocus = FocusNode();
  final ImagePicker _imagePicker;
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
    final userId = await _getUserIdUseCase();
    _id = userId.data ?? '';
    final response = await _getUserProfileUseCase(_id);
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        final data = response.data;
        if (data != null) {
          firstNameController.text = data.firstName;
          lastNameController.text = data.lastName;
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
    final base64 = file != null ? await _imageToBase64UseCase(file) : null;
    final response = await _updateUserProfileUseCase(
      UserEntity(
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
    final pickedFile = await _imagePicker.getImage(
        source: source, preferredCameraDevice: CameraDevice.rear, imageQuality: 90, maxHeight: 500, maxWidth: 500);
    if (pickedFile != null) {
      file = io.File(pickedFile.path);
      image.value = file;
    }
  }

  Future logout() async {
    await _logOutUseCase();
    Get.offAllNamed(Routes.signIn);
  }

//endregion

}
