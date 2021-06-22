import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_images.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_font_weight.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../generated/l10n.dart';
import 'change_password_controller.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: context.breakpoint <= LayoutBreakpoint.xs
            ? RadioLifeAppBarWidget(
                showBackButton: false,
                leadingWidth: 0,
                title: Hero(
                  tag: 'logo',
                  child: Image.asset(AppImages.logoHorizontalColor, height: 40),
                ),
                centerTitle: true,
                backButtonColor: Colors.black,
              )
            : null,
        body: Center(
          child: Container(
            constraints: BoxConstraints(
                maxWidth: context.breakpoint > LayoutBreakpoint.xs
                    ? 1000
                    : MediaQuery.of(context).size.width),
            padding: const EdgeInsets.all(AppSpacing.medium),
            child: context.breakpoint > LayoutBreakpoint.xs
                ? _buildWebBody(context)
                : _buildAppBody(context),
          ),
        ),
      );

  Widget _buildAppBody(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                S.of(context).updatePassword,
                style: const TextStyle(
                    fontSize: AppFontSize.mega,
                    fontWeight: AppFontWeight.regular,
                    color: Colors.black),
              ),
              UIHelper.verticalSpaceExtraLarge,
              InputTextWidget(
                hintText: S.of(context).temporaryPassword,
                onFieldSubmitted: () {},
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: controller.temporaryPassword,
                errorText: null,
              ),
              UIHelper.verticalSpaceMedium,
              InputTextWidget(
                hintText: S.of(context).newPassword,
                onFieldSubmitted: () {},
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: controller.newPassword,
                errorText: null,
              ),
              UIHelper.verticalSpaceMedium,
              InputTextWidget(
                hintText: S.of(context).confirmPassword,
                onFieldSubmitted: () {},
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: controller.confirmPassword,
                errorText: null,
              ),
            ],
          ),
          UIHelper.verticalSpaceUltra,
          PrimaryButton(
              onPressed: () {
                Get.back();
              },
              title: S.of(context).updatePassword,
              color: PrimaryButtonColor.primary,
              type: PrimaryButtonType.circular,
              style: PrimaryButtonStyle.filled,
              state: Status.success),
        ],
      );

  Widget _buildWebBody(BuildContext context) => Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).resetPassword,
                      style: const TextStyle(
                          fontSize: AppFontSize.mega,
                          fontWeight: AppFontWeight.bold,
                          color: Colors.black),
                    ),
                    UIHelper.verticalSpaceLarge,
                    UIHelper.verticalSpaceLarge,
                    InputTextWidget(
                      hintText: S.of(context).temporaryPassword,
                      onFieldSubmitted: () {},
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: controller.temporaryPassword,
                      errorText: null,
                    ),
                    UIHelper.verticalSpaceMedium,
                    InputTextWidget(
                      hintText: S.of(context).newPassword,
                      onFieldSubmitted: () {},
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: controller.newPassword,
                      errorText: null,
                    ),
                    UIHelper.verticalSpaceMedium,
                    InputTextWidget(
                      hintText: S.of(context).confirmPassword,
                      onFieldSubmitted: () {},
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: controller.confirmPassword,
                      errorText: null,
                    ),
                  ],
                ),
                UIHelper.verticalSpaceUltra,
                PrimaryButton(
                    onPressed: () {
                      Get.back();
                    },
                    title: S.of(context).updatePassword,
                    color: PrimaryButtonColor.primary,
                    type: PrimaryButtonType.circular,
                    style: PrimaryButtonStyle.filled,
                    state: Status.success),
              ],
            ),
          ),
          Flexible(
            child: Center(
              child: Hero(
                tag: 'logo',
                child: Image.asset(AppImages.logoVerticalColor, height: 300),
              ),
            ),
          )
        ],
      );
}
