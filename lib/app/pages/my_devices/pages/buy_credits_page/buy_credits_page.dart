import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/flavors/flavor_values.dart';

import 'package:radio_life/generated/l10n.dart';
import 'buy_credits_controller.dart';

class BuyCreditsPage extends GetView<BuyCreditsController> {
  static Future? navigateWith({required String deviceId}) => Get.toNamed(Routes.buyCreditsPage, arguments: deviceId);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).buyCredits,
          backgroundColor: FlavorConfig.instance.color,
          onBackButtonPressed: () {
            Get.back();
          },
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(
                maxWidth: context.breakpoint > LayoutBreakpoint.xs ? 500 : MediaQuery.of(context).size.width),
            padding: const EdgeInsets.all(AppSpacing.medium),
            child: Obx(
              () {
                final data = controller.state.value.data;
                if (data == null) return Container();
                final locale = Localizations.localeOf(context);
                final format = NumberFormat.simpleCurrency(locale: locale.toString());

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length + 1,
                  itemBuilder: (context, index) => index < data.length
                      ? Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(vertical: AppSpacing.tiny),
                          // color: data[index].backgroundColor,
                          color: controller.backgroudColor(data[index]),
                          child: InkWell(
                            splashColor: controller.backgroudColor(data[index]) == AppColorScheme.primarySwatch
                                ? AppColorScheme.white.withOpacity(0.2)
                                : AppColorScheme.primarySwatch.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              controller.selectPlan(index);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(AppSpacing.medium),
                              child: Column(
                                children: [
                                  Text(
                                    data[index].nameStr,
                                    style: TextStyle(
                                      fontSize: AppFontSize.medium,
                                      color: controller.textColor(data[index]),
                                    ),
                                  ),
                                  UIHelper.verticalSpaceExtraSmall,
                                  Text(
                                    '${data[index].creditVl}',
                                    style: TextStyle(
                                      fontSize: AppFontSize.medium,
                                      color: controller.textColor(data[index]),
                                    ),
                                  ),
                                  UIHelper.verticalSpaceExtraSmall,
                                  Text(
                                    '${format.currencySymbol}${data[index].valueVl}',
                                    style: TextStyle(
                                      fontSize: AppFontSize.medium,
                                      color: controller.textColor(data[index]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: AppSpacing.large),
                          child: PrimaryButton(
                            onPressed: () {
                              controller.signDevicePlan();
                            },
                            title: S.of(context).buyNow,
                            color: PrimaryButtonColor.secondary,
                            type: PrimaryButtonType.circular,
                            style: PrimaryButtonStyle.filled,
                            state: Status.success,
                          ),
                        ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 0,
        ),
      );
}
