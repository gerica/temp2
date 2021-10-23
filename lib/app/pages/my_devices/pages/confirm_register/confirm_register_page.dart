import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_font_weight.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../generated/l10n.dart';
import 'confirm_register_controller.dart';

class ConfirmRegisterPage extends GetView<ConfirmRegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RadioLifeAppBarWidget(
        showBackButton: true,
        brightness: Brightness.dark,
        titleText: S.of(context).newDevice,
        backgroundColor: AppColorScheme.primarySwatch,
        onBackButtonPressed: () {
          Get.back();
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: Obx(() => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        S.of(context).titleConfirmRegisterDevice(controller.serialNumber.value),
                        style: const TextStyle(
                          fontSize: AppFontSize.extraLarge,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                      UIHelper.verticalSpaceLarge,
                      Text(
                        S.of(context).textConfirmRegisterDevice,
                        style: const TextStyle(
                          fontSize: AppFontSize.medium,
                          fontWeight: AppFontWeight.medium,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PrimaryButton(
                        onPressed: () => controller.pressRegister(),
                        title: S.of(context).btnRegister,
                        color: PrimaryButtonColor.primary,
                        type: PrimaryButtonType.circular,
                        style: PrimaryButtonStyle.filled,
                        state: Status.success,
                      ),
                      UIHelper.verticalSpaceMedium,
                      PrimaryButton(
                        onPressed: () async {
                          Get.back();
                        },
                        title: S.of(context).cancel,
                        color: PrimaryButtonColor.primary,
                        type: PrimaryButtonType.circular,
                        style: PrimaryButtonStyle.bordered,
                        state: Status.success,
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(
        currentIndex: 0,
      ),
    );
  }
}
