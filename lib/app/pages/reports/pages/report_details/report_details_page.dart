import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/flavors/flavor_values.dart';

import 'package:radio_life/generated/l10n.dart';
import 'params/report_details_params.dart';
import 'report_details_controller.dart';

class ReportDetailsPage extends GetView<ReportDetailsController> {
  static Future? navigateWith({required ReportDetailsParams params}) =>
      Get.toNamed(Routes.reportDetails, arguments: params);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RadioLifeAppBarWidget(
        showBackButton: true,
        brightness: Brightness.dark,
        titleText: S.of(context).products,
        backgroundColor: FlavorConfig.instance.color,
        title: Text(
          S.of(context).titleReportDetails,
          style: const TextStyle(color: AppColorScheme.white),
        ),
        onBackButtonPressed: () {
          Get.back();
        },
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
              maxWidth: context.breakpoint > LayoutBreakpoint.xs ? 500 : MediaQuery.of(context).size.width),
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  '${S.of(context).textDevice}: ${controller.state.value.data?.myDeviceEntity?.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: AppFontSize.mega,
                  ),
                ),
                subtitle: Text(
                  '${S.of(context).textExam}: ${controller.state.value.data?.examNumber}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: AppFontSize.medium,
                  ),
                ),
                // trailing: ClipRRect(
                //   borderRadius: BorderRadius.circular(50),
                //   child: controller.result ? Image.asset(AppImages.faceSad) : Image.asset(AppImages.faceHappy),
                // ),
              ),
              UIHelper.verticalSpaceLarge,
              Row(
                children: [
                  _chip(controller.state.value.data?.myDeviceEntity?.type ?? ''),
                  _chip(DateFormat('dd/MM/yyyy:HH:mm:ss').format(controller.state.value.data?.date as DateTime)),
                  _chip(controller.state.value.data?.myDeviceEntity?.locate ?? ''),
                ],
              ),
              UIHelper.verticalSpaceLarge,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: controller.result ? AppColorScheme.yellow : AppColorScheme.success,
                ),
                child: Column(
                  children: [
                    Text(
                      controller.result ? S.of(context).positive : S.of(context).negative,
                      style: const TextStyle(
                        color: Color(0xFF2A0210),
                        fontSize: AppFontSize.mega,
                      ),
                    ),
                    // UIHelper.verticalSpaceMedium,
                    // Text(
                    //   controller.result ? S.of(context).textResultPositive : S.of(context).textResultNegative,
                    //   style: const TextStyle(
                    //     color: Color(0xFF2A0210),
                    //     fontSize: AppFontSize.secondary,
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(
        currentIndex: 1,
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
