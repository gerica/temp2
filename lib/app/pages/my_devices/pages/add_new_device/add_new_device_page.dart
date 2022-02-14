import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import 'package:radio_life/generated/l10n.dart';
import 'add_new_device_controller.dart';

class AddNewDevicePage extends GetView<AddNewDeviceController> {
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
        child: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  _buildForms(context),
                  UIHelper.verticalSpaceLarge,
                  PrimaryButton(
                    onPressed: () => controller.pressContinue(),
                    title: S.of(context).continue_label,
                    color: PrimaryButtonColor.primary,
                    type: PrimaryButtonType.circular,
                    style: PrimaryButtonStyle.filled,
                    state: Status.success,
                  ),
                  UIHelper.verticalSpaceMedium,
                  PrimaryButton(
                    onPressed: () async {
                      final result = await Get.toNamed(Routes.qrCodeViewer);
                      if (result != null) {
                        final initSerialNumber = result.indexOf('sr:');
                        if (initSerialNumber >= 0) {
                          controller.serialNumberController.text = result.substring(initSerialNumber + 4, initSerialNumber + 9);
                          controller.serialNumberError('');
                        }
                      }
                    },
                    title: S.of(context).qrCode,
                    color: PrimaryButtonColor.primary,
                    type: PrimaryButtonType.circular,
                    style: PrimaryButtonStyle.bordered,
                    state: Status.success,
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

  Widget _buildForms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputTextWidget(
          hintText: S.of(context).serialNumber,
          keyboardType: TextInputType.number,
          textCapitalization: TextCapitalization.words,
          controller: controller.serialNumberController,
          errorText: controller.serialNumberError.value == '' ? null : controller.serialNumberError.value,
          focusNode: controller.serialNumberFocus,
          onFieldSubmitted: () {
            if (controller.serialNumberError.value.isNotEmpty) {
              controller.serialNumberError('');
            }
          },
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
