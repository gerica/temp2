import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../../../../generated/l10n.dart';
import 'add_new_device_controller.dart';

class AddNewDevicePage extends GetView<AddNewDeviceController> {
  @override
  Widget build(BuildContext context) => Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildForms(context),
              UIHelper.verticalSpaceLarge,
              PrimaryButton(
                onPressed: () {},
                title: S.of(context).confirmNewDevice,
                color: PrimaryButtonColor.primary,
                type: PrimaryButtonType.circular,
                style: PrimaryButtonStyle.filled,
                state: Status.success,
              ),
              UIHelper.verticalSpaceMedium,
              PrimaryButton(
                onPressed: () async {
                  final result = await Get.toNamed(Routes.qrCodeViewer);
                  if (result != null)
                    Get.snackbar(
                      'QR Code',
                      result,
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.black,
                      margin: const EdgeInsets.all(16),
                    );
                },
                title: S.of(context).qrCode,
                color: PrimaryButtonColor.primary,
                type: PrimaryButtonType.circular,
                style: PrimaryButtonStyle.bordered,
                state: Status.success,
              ),
            ],
          ),
        ),
      ));

  Widget _buildForms(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputTextWidget(
            hintText: S.of(context).serialNumber,
            onFieldSubmitted: () {},
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.words,
            controller: controller.serialNumberController,
            errorText: null,
          ),
          UIHelper.verticalSpaceMedium,
          InputTextWidget(
            hintText: S.of(context).location,
            onFieldSubmitted: () {},
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            controller: controller.locationController,
            errorText: null,
          ),
        ],
      );
}
