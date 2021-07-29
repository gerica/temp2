import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_images.dart';
import 'package:radio_life/app/styles/app_font_weight.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../generated/l10n.dart';
import 'crate_password_controller.dart';

class CreatePasswordPage extends GetView<CreatePasswordController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: context.breakpoint <= LayoutBreakpoint.xs
            ? RadioLifeAppBarWidget(
                showBackButton: false,
                leadingWidth: 0,
                title: Hero(
                  tag: 'logo',
                  child: Image.asset(AppImages.logoHorizontalColor, height: 40),
                ),
                centerTitle: true,
              )
            : null,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.medium),
            constraints: BoxConstraints(
                maxWidth: context.breakpoint > LayoutBreakpoint.xs
                    ? 500
                    : MediaQuery.of(context).size.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).updatePassword,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: AppFontWeight.regular,
                      color: Colors.black),
                ),
                UIHelper.verticalSpaceExtraLarge,
                UIHelper.verticalSpaceMedium,
                InputTextWidget(
                  hintText: S.of(context).temporaryPassword,
                  onFieldSubmitted: () {},
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textCapitalization: TextCapitalization.words,
                  controller: controller.temporaryPasswordController,
                  errorText: null,
                ),
                UIHelper.verticalSpaceMedium,
                InputTextWidget(
                  hintText: S.of(context).newPassword,
                  onFieldSubmitted: () {},
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textCapitalization: TextCapitalization.words,
                  controller: controller.newPasswordController,
                  errorText: null,
                ),
                UIHelper.verticalSpaceMedium,
                InputTextWidget(
                  hintText: S.of(context).confirmPassword,
                  onFieldSubmitted: () {},
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  controller: controller.confirmPasswordController,
                  errorText: null,
                ),
                UIHelper.verticalSpaceExtraLarge,
                PrimaryButton(
                    onPressed: () => controller.performChangePassword(),
                    title: S.of(context).updatePassword,
                    color: PrimaryButtonColor.primary,
                    type: PrimaryButtonType.circular,
                    style: PrimaryButtonStyle.filled,
                    state: Status.success),
              ],
            ),
          ),
        ),
      );
}
