import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/domain/entities/device/device_entity.dart';
import 'package:radio_life/app/helper/platform_svg.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_svg_images.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/flavors/flavor_values.dart';

import 'package:radio_life/generated/l10n.dart';
import 'my_device_detail_controller.dart';

class MyDeviceDetailPage extends GetView<MyDeviceDetailController> {
  static Future? navigateWith({required MyDeviceEntity params}) =>
      Get.toNamed(Routes.myDeviceDetail, arguments: params);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RadioLifeAppBarWidget(
        showBackButton: true,
        brightness: Brightness.dark,
        titleText: S.of(context).myDevice,
        backgroundColor: FlavorConfig.instance.color,
        onBackButtonPressed: () => controller.goToMyDevicePage(),
      ),
      body: Obx(() => Center(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: context.breakpoint > LayoutBreakpoint.xs ? 500 : MediaQuery.of(context).size.width),
              padding: const EdgeInsets.all(AppSpacing.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    controller.state.value.data?.name ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: AppFontSize.mega,
                    ),
                  ),
                  UIHelper.verticalSpaceLarge,
                  Row(
                    children: [
                      _chip(controller.state.value.data?.type ?? ''),
                      _chip('Serial N ${controller.state.value.data?.serialNumber}'),
                      _chip(controller.state.value.data?.locate ?? ''),
                    ],
                  ),
                  UIHelper.verticalSpaceLarge,
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: 190,
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PlatformSvg.asset(AppSvgImages.icTicker),
                          UIHelper.verticalSpaceSmall,
                          AutoSizeText(
                            S.of(context).creditsCounter(controller.balance),
                            maxLines: 1,
                            style: const TextStyle(
                              color: Color(0xFF2A0210),
                              fontSize: AppFontSize.large,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  UIHelper.verticalSpaceMedium,
                  PrimaryButton(
                    onPressed: () => controller.goToBuyCredit(),
                    title: S.of(context).buyCredits,
                    icon: PlatformSvg.asset(AppSvgImages.icShop),
                    color: PrimaryButtonColor.secondary,
                    type: PrimaryButtonType.circular,
                    style: PrimaryButtonStyle.filled,
                    state: Status.success,
                  )
                ],
              ),
            ),
          )),
      bottomNavigationBar: const AppBottomNavigationBarWidget(
        currentIndex: 0,
      ),
    );
  }

  Widget _chip(String text, {Color? color}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: color ?? AppColorScheme.blueLight,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: AppFontSize.small),
      ),
    );
  }
}
