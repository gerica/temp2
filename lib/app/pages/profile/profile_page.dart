import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_images.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  ],
                ),
                PrimaryButton(
                    onPressed: () {},
                    title: S.of(context).logOut,
                    color: PrimaryButtonColor.secondary,
                    type: PrimaryButtonType.circular,
                    style: PrimaryButtonStyle.bordered,
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
