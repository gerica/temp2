import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/helper/platform_svg.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_svg_images.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/flavors/flavor_values.dart';

import 'package:radio_life/generated/l10n.dart';
import 'configure_wifi_controller.dart';

class ConfigureWiFiPage extends GetView<ConfigureWiFiController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).configureWifi,
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
                _buildForms(context),
                UIHelper.verticalSpaceLarge,
                Obx(
                  () => PrimaryButton(
                    onPressed: () => controller.nextPage(),
                    title: S.of(context).next,
                    color: controller.formValid.value ? PrimaryButtonColor.primary : PrimaryButtonColor.error,
                    type: PrimaryButtonType.circular,
                    style: PrimaryButtonStyle.filled,
                    state: Status.success,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 0,
        ),
      );

  Widget _buildForms(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputTextWidget(
          hintText: S.of(context).wifiSsid,
          onFieldSubmitted: () {},
          prefixIcon: PlatformSvg.asset(AppSvgImages.icWiFi),
          suffixIcon: InkWell(
            onTap: () => controller.openAppSettings(),
            child: PlatformSvg.asset(AppSvgImages.icSearch),
          ),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          controller: controller.wifiSSIDNumberController,
          errorText: null,
          onChanged: (value) => controller.validated(),
          readOnly: true,
        ),
        UIHelper.verticalSpaceMedium,
        Obx(() => InputTextWidget(
              hintText: S.of(context).password,
              onFieldSubmitted: () {},
              obscureText: controller.hidePassword.value,
              prefixIcon: PlatformSvg.asset(AppSvgImages.icKey),
              suffixIcon: InkWell(
                onTap: () => controller.togglePasswordVisibility,
                child: PlatformSvg.asset(AppSvgImages.icEye),
              ),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              controller: controller.wifiPasswordController,
              errorText: null,
              onChanged: (value) => controller.validated(),
            )),
      ],
    );
  }
}
