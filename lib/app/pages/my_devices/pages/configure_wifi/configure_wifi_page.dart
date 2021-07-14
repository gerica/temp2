import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../generated/l10n.dart';
import 'configure_wifi_controller.dart';

class ConfigureWiFiPage extends GetView<ConfigureWiFiController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).configureWifi,
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
                  title: S.of(context).next,
                  color: PrimaryButtonColor.primary,
                  type: PrimaryButtonType.circular,
                  style: PrimaryButtonStyle.filled,
                  state: Status.success,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 1,
        ),
      );

  Widget _buildForms(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputTextWidget(
            hintText: S.of(context).serialNumber,
            onFieldSubmitted: () {},
            prefixIcon: const Icon(Icons.wifi),
            suffixIcon: const Icon(Icons.search),
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.words,
            controller: controller.serialNumberController,
            errorText: null,
          ),
          UIHelper.verticalSpaceMedium,
          InputTextWidget(
            hintText: S.of(context).location,
            onFieldSubmitted: () {},
            prefixIcon: const Icon(Icons.vpn_key_outlined),
            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            controller: controller.locationController,
            errorText: null,
          ),
        ],
      );
}
