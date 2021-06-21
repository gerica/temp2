import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/platform_svg.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_svg_images.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_font_weight.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../generated/l10n.dart';
import 'support_controller.dart';

class SupportPage extends GetView<SupportController> {
  @override
  Widget build(BuildContext context) => KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) => Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: RadioLifeAppBarWidget(
            showBackButton: false,
            brightness: Brightness.dark,
            titleText: S.of(context).support,
            backgroundColor: AppColorScheme.primarySwatch,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list, color: AppColorScheme.white),
              )
            ],
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
                    Text(
                      S.of(context).faqUpperCase,
                      style: const TextStyle(color: Colors.black, fontSize: AppFontSize.mega),
                    ),
                    UIHelper.verticalSpaceMedium,
                    InkWell(
                      onTap: () {},
                      child: Text(
                        S.of(context).howDoIAddMoreCredits,
                        style: TextStyle(
                            color: AppColorScheme.blue,
                            fontSize: AppFontSize.medium,
                            fontWeight: AppFontWeight.regular),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    InkWell(
                      onTap: () {},
                      child: Text(
                        S.of(context).howCanIAddADevice,
                        style: TextStyle(
                            color: AppColorScheme.blue,
                            fontSize: AppFontSize.medium,
                            fontWeight: AppFontWeight.regular),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    InkWell(
                      onTap: () {},
                      child: Text(
                        S.of(context).isItPossibleToSeeMyResults,
                        style: TextStyle(
                            color: AppColorScheme.blue,
                            fontSize: AppFontSize.medium,
                            fontWeight: AppFontWeight.regular),
                      ),
                    ),
                    UIHelper.verticalSpaceUltra,
                    Text(
                      S.of(context).stillNeedHelpSendUsAMessage,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: AppFontSize.medium,
                          fontWeight: AppFontWeight.regular),
                    ),
                    UIHelper.verticalSpaceMedium,
                    InputTextWidget(
                      hintText: S.of(context).yourMessage,
                      onFieldSubmitted: () {},
                      keyboardType: TextInputType.multiline,
                      minLines: 7,
                      maxLines: 7,
                      borderColor: AppColorScheme.accentColor,
                      controller: controller.helpMessageController,
                      errorText: null,
                    ),
                    UIHelper.verticalSpaceLarge,
                    Align(
                      alignment: Alignment.centerRight,
                      child: PrimaryButton(
                          onPressed: () {},
                          title: S.of(context).send,
                          width: 120,
                          icon: PlatformSvg.asset(AppSvgImages.icSend, color: AppColorScheme.white),
                          color: PrimaryButtonColor.primary,
                          type: PrimaryButtonType.circular,
                          style: PrimaryButtonStyle.filled,
                          state: Status.success),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: const AppBottomNavigationBarWidget(
            currentIndex: 3,
          ),
        ),
      );
}
