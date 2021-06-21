import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_images.dart';
import 'package:radio_life/app/pages/profile/pages/update_password/update_password_controller.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../../../generated/l10n.dart';

class UpdatePasswordPage extends GetView<UpdatePasswordController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
            showBackButton: true,
            brightness: Brightness.dark,
            titleText: S.of(context).password,
            backgroundColor: AppColorScheme.primarySwatch,
            onBackButtonPressed: () {
              Get.back();
            }),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.medium),
            constraints: BoxConstraints(
                maxWidth: context.breakpoint > LayoutBreakpoint.xs
                    ? 500
                    : MediaQuery.of(context).size.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UIHelper.verticalSpaceLarge,
                Center(
                  child: Hero(
                    tag: 'avatar',
                    child: Image.asset(AppImages.avatar2, height: 96),
                  ),
                ),
                UIHelper.verticalSpaceLarge,
                Text(
                  S.of(context).updatePassword,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                UIHelper.verticalSpaceMedium,
                InputTextWidget(
                  hintText: S.of(context).currentPassword,
                  onFieldSubmitted: () {},
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textCapitalization: TextCapitalization.words,
                  controller: controller.currentPasswordController,
                  errorText: null,
                ),
                UIHelper.verticalSpaceMedium,
                InputTextWidget(
                  hintText: S.of(context).newPassword,
                  onFieldSubmitted: () {},
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textCapitalization: TextCapitalization.words,
                  controller: controller.newPasswordController,
                  errorText: null,
                ),
                UIHelper.verticalSpaceMedium,
                InputTextWidget(
                  hintText: S.of(context).confirmPassword,
                  onFieldSubmitted: () {},
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  controller: controller.confirmPasswordController,
                  errorText: null,
                ),
                UIHelper.verticalSpaceLarge,
                PrimaryButton(
                    onPressed: () {},
                    title: S.of(context).updatePassword,
                    color: PrimaryButtonColor.primary,
                    type: PrimaryButtonType.circular,
                    style: PrimaryButtonStyle.filled,
                    state: Status.success),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 4,
        ),
      );
}
