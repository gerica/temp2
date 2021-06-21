import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_images.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';

import '../../../../../generated/l10n.dart';
import 'params/report_details_params.dart';
import 'report_details_controller.dart';

class ReportDetailsPage extends GetView<ReportDetailsController> {
  static Future? navigateWith({required ReportDetailsParams params}) =>
      Get.toNamed(Routes.reportDetails, arguments: params);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).products,
          backgroundColor: AppColorScheme.primarySwatch,
          title: Obx(
            () => Text(
              controller.state.value.data?.title ?? '',
              style: const TextStyle(color: AppColorScheme.white),
            ),
          ),
          onBackButtonPressed: () {
            Get.back();
          },
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(
                maxWidth: context.breakpoint > LayoutBreakpoint.xs
                    ? 500
                    : MediaQuery.of(context).size.width),
            padding: const EdgeInsets.all(AppSpacing.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Company Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppFontSize.mega,
                    ),
                  ),
                  subtitle: const Text(
                    'Address',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppFontSize.medium,
                    ),
                  ),
                  trailing: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(AppImages.avatar),
                  ),
                ),
                UIHelper.verticalSpaceLarge,
                Row(
                  children: [
                    _chip('Covid 19'),
                    _chip('04/01/2021 - 15h34m'),
                    _chip('São Paulo'),
                  ],
                ),
                UIHelper.verticalSpaceLarge,
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: controller.state.value.data?.status == 'Analyzing'
                        ? AppColorScheme.yellow
                        : controller.state.value.data?.status == 'Contaminated'
                            ? AppColorScheme.orange
                            : AppColorScheme.success,
                  ),
                  child: Column(
                    children: [
                      Text(
                        controller.state.value.data?.status ?? '',
                        style: const TextStyle(
                          color: Color(0xFF2A0210),
                          fontSize: AppFontSize.mega,
                        ),
                      ),
                      UIHelper.verticalSpaceMedium,
                      Text(
                        S.of(context).loremIpsum,
                        style: const TextStyle(
                          color: Color(0xFF2A0210),
                          fontSize: AppFontSize.secondary,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 2,
        ),
      );

  Widget _chip(String text, {Color? color}) => Container(
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
