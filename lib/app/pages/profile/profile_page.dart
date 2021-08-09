import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/modal_helper.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../generated/l10n.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: false,
          brightness: Brightness.dark,
          titleText: S.of(context).profile,
          backgroundColor: AppColorScheme.primarySwatch,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.medium),
            constraints: BoxConstraints(
                maxWidth: context.breakpoint > LayoutBreakpoint.xs
                    ? 500
                    : MediaQuery.of(context).size.width),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      UIHelper.verticalSpaceLarge,
                      Center(
                        child: InkWell(
                          onTap: () {
                            ModalHelper.modalBottomSheet(
                              context: context,
                              child: Container(
                                color: AppColorScheme.white,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 30,
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                        controller.getImage(ImageSource.camera);
                                      },
                                      title: Text(S.of(context).camera),
                                    ),
                                    UIHelper.horizontalSpaceSmall,
                                    Container(
                                      height: 0.3,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      color: AppColorScheme.gray1,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    UIHelper.horizontalSpaceSmall,
                                    ListTile(
                                      leading: const Icon(
                                        Icons.image_outlined,
                                        size: 30,
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                        controller
                                            .getImage(ImageSource.gallery);
                                      },
                                      title: Text(S.of(context).gallery),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Stack(
                              fit: StackFit.loose,
                              children: [
                                Container(
                                  child: Hero(
                                    tag: 'avatar',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Obx(
                                        () {
                                          final file = controller.image.value;
                                          final url = controller.imageUrl.value;
                                          if (url != null && file == null)
                                            return Image.network(
                                              url,
                                              fit: BoxFit.cover,
                                              height: 90,
                                              width: 90,
                                            );
                                          return file == null
                                              ? Container(
                                                  height: 90,
                                                  width: 90,
                                                  color:
                                                      AppColorScheme.lightGray,
                                                  child: const Icon(
                                                      Icons.person,
                                                      size: 50),
                                                )
                                              : Image.file(
                                                  file,
                                                  fit: BoxFit.cover,
                                                  height: 90,
                                                  width: 90,
                                                );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColorScheme.primarySwatch,
                                    ),
                                    child: const Icon(Icons.edit_outlined,
                                        color: AppColorScheme.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      UIHelper.verticalSpaceLarge,
                      Text(
                        S.of(context).profile,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      UIHelper.verticalSpaceMedium,
                      InputTextWidget(
                        hintText: S.of(context).firstName,
                        onFieldSubmitted: () {},
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        controller: controller.firstNameController,
                        errorText: null,
                      ),
                      UIHelper.verticalSpaceMedium,
                      InputTextWidget(
                        hintText: S.of(context).lastName,
                        onFieldSubmitted: () {},
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        controller: controller.lastNameController,
                        errorText: null,
                      ),
                      UIHelper.verticalSpaceMedium,
                      PrimaryButton(
                          onPressed: () => controller.updateUserProfile(),
                          title: S.of(context).save,
                          color: PrimaryButtonColor.primary,
                          type: PrimaryButtonType.circular,
                          style: PrimaryButtonStyle.filled,
                          state: Status.success),
                      UIHelper.verticalSpaceLarge,
                      Text(
                        S.of(context).password,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      UIHelper.verticalSpaceMedium,
                      PrimaryButton(
                          onPressed: () {
                            Get.toNamed(Routes.updatePassword);
                          },
                          title: S.of(context).updatePassword,
                          color: PrimaryButtonColor.primary,
                          type: PrimaryButtonType.circular,
                          style: PrimaryButtonStyle.filled,
                          state: Status.success),
                      UIHelper.verticalSpaceSmall,
                    ],
                  ),
                  PrimaryButton(
                      onPressed: () => controller.logout(),
                      title: S.of(context).logOut,
                      color: PrimaryButtonColor.secondary,
                      type: PrimaryButtonType.circular,
                      style: PrimaryButtonStyle.bordered,
                      state: Status.success),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 4,
        ),
      );
}
