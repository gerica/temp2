import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/domain/entities/plans/plan_entity.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/flavors/flavor_values.dart';

import 'package:radio_life/generated/l10n.dart';
import 'credit_transaction_success_controller.dart';

class CreditTransactionSuccessPage extends GetView<CreditTransactionSuccessController> {
  static Future? navigateWith({required PlanEntity arguments}) => Get.offNamedUntil(
        Routes.creditsTransactionSuccess,
        ModalRoute.withName('/'),
        arguments: arguments,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: 'Order',
          backgroundColor: FlavorConfig.instance.color,
          onBackButtonPressed: () => controller.goToMyDevicePage(),
        ),
        body: Obx(() => Center(
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: context.breakpoint > LayoutBreakpoint.xs ? 500 : MediaQuery.of(context).size.width),
                padding: const EdgeInsets.all(AppSpacing.medium),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpaceLarge,
                      Center(
                        child: Icon(
                          Icons.check_circle_outline,
                          color: AppColorScheme.primarySwatch,
                          size: 120,
                        ),
                      ),
                      UIHelper.verticalSpaceMedium,
                      Text(
                        S.of(context).purchaseCompleted,
                        style: const TextStyle(fontSize: AppFontSize.mega, color: Colors.black),
                      ),
                      UIHelper.verticalSpaceMedium,
                      Row(
                        children: [
                          Text(
                            S.of(context).orderDetails,
                            style: TextStyle(
                              color: AppColorScheme.gray1,
                            ),
                          ),
                          UIHelper.horizontalSpaceLarge,
                          Text(
                            S.of(context).radiolifeco,
                            style: TextStyle(
                              color: AppColorScheme.primarySwatch,
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpaceSmall,
                      Text(
                        S.of(context).orderDetailsText,
                        style: TextStyle(color: AppColorScheme.gray1, fontSize: AppFontSize.secondary),
                      ),
                      UIHelper.verticalSpaceMedium,
                      Text(
                        S.of(context).dateOfPurchase(
                              DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(DateTime.now()),
                            ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      UIHelper.verticalSpaceMedium,
                      Text(
                        S.of(context).amountPaid(controller.state.value.data?.value ?? ''),
                        style: const TextStyle(color: Colors.black),
                      ),
                      UIHelper.verticalSpaceLarge,
                      PrimaryButton(
                        onPressed: () => controller.goToMyDevicePage(),
                        title: S.of(context).backToMyDevices,
                        color: PrimaryButtonColor.primary,
                        type: PrimaryButtonType.circular,
                        style: PrimaryButtonStyle.filled,
                        state: Status.success,
                      )
                    ],
                  ),
                ),
              ),
            )),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 0,
        ),
      );
}
