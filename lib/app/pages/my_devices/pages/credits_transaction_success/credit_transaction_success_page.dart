import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../generated/l10n.dart';
import 'credit_transaction_success_controller.dart';

class CreditTransactionSuccessPage extends GetView<CreditTransactionSuccessController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: 'Order 45321',
          backgroundColor: AppColorScheme.primarySwatch,
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
                    S.of(context).loremIpsum,
                    style: TextStyle(color: AppColorScheme.gray1, fontSize: AppFontSize.secondary),
                  ),
                  UIHelper.verticalSpaceMedium,
                  Text(
                    S.of(context).dateOfPurchase('Sep 24, 2021'),
                    style: const TextStyle(color: Colors.black),
                  ),
                  UIHelper.verticalSpaceMedium,
                  Text(
                    S.of(context).amountPaid('\$59.90'),
                    style: const TextStyle(color: Colors.black),
                  ),
                  UIHelper.verticalSpaceLarge,
                  PrimaryButton(
                    onPressed: () {
                      Get.offAllNamed(
                        Routes.myDevices,
                        predicate: ModalRoute.withName('/'),
                      );
                    },
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
        ),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 0,
        ),
      );
}
