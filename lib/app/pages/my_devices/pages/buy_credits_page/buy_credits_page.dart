import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../generated/l10n.dart';
import 'buy_credits_controller.dart';

class BuyCreditsPage extends GetView<BuyCreditsController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).buyCredits,
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
            child: Obx(
              () {
                final data = controller.state.value.data;
                if (data == null) return Container();
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length + 1,
                  itemBuilder: (context, index) => index < data.length
                      ? Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(vertical: AppSpacing.tiny),
                          color: data[index].backgroundColor,
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.medium),
                            child: Column(
                              children: [
                                Text(
                                  data[index].name,
                                  style: TextStyle(
                                    fontSize: AppFontSize.medium,
                                    color: data[index].textColor,
                                  ),
                                ),
                                UIHelper.verticalSpaceExtraSmall,
                                Text(
                                  data[index].price,
                                  style: TextStyle(
                                    fontSize: AppFontSize.medium,
                                    color: data[index].textColor,
                                  ),
                                ),
                                UIHelper.verticalSpaceExtraSmall,
                                Text(
                                  data[index].amountOfCredits,
                                  style: TextStyle(
                                    fontSize: AppFontSize.medium,
                                    color: data[index].textColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: AppSpacing.large),
                          child: PrimaryButton(
                            onPressed: () {},
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
          currentIndex: 1,
        ),
      );
}
