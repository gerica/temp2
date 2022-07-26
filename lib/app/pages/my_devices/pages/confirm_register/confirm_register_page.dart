import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_font_weight.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/flavors/flavor_values.dart';

import 'package:radio_life/generated/l10n.dart';
import 'confirm_register_controller.dart';

class ConfirmRegisterPage extends GetView<ConfirmRegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RadioLifeAppBarWidget(
        showBackButton: true,
        brightness: Brightness.dark,
        titleText: S.of(context).newDevice,
        backgroundColor: FlavorConfig.instance.color,
        onBackButtonPressed: () {
          Get.back();
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ..._buildBody(context),
              ..._buildButtons(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(
        currentIndex: 0,
      ),
    );
  }

  List<Widget> _buildBody(BuildContext context) {
    final List<Widget> result = [];

    result.add(Text(
      S.of(context).titleConfirmRegisterDevice(controller.serialNumber.value),
      style: const TextStyle(
        fontSize: AppFontSize.extraLarge,
        fontWeight: AppFontWeight.bold,
      ),
    ));
    result.add(UIHelper.verticalSpaceLarge);
    result.add(Text(
      S.of(context).textConfirmRegisterDevice,
      style: const TextStyle(
        fontSize: AppFontSize.medium,
        fontWeight: AppFontWeight.medium,
      ),
    ));
    result.add(UIHelper.verticalSpaceLarge);
    result.add(Text(
      S.of(context).textConfirmRegisterDeviceName,
      style: const TextStyle(
        fontSize: AppFontSize.medium,
        fontWeight: AppFontWeight.medium,
      ),
    ));
    result.add(UIHelper.verticalSpaceLarge);
    result.add(
      InputTextWidget(
        hintText: S.of(context).name,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        controller: controller.nameController,
        onFieldSubmitted: () {},
        textInputAction: TextInputAction.next,
      ),
    );
    return result;
  }

  List<Widget> _buildButtons(BuildContext context) {
    final List<Widget> result = [];

    result.add(UIHelper.verticalSpaceMega);
    result.add(
      PrimaryButton(
        onPressed: () => controller.pressRegister(),
        title: S.of(context).btnRegister,
        color: PrimaryButtonColor.primary,
        type: PrimaryButtonType.circular,
        style: PrimaryButtonStyle.filled,
        state: Status.success,
      ),
    );
    result.add(UIHelper.verticalSpaceMedium);
    result.add(
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
    );

    return result;
  }
}
