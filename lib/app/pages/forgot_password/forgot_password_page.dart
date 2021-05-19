import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../generated/l10n.dart';
import '../../radio_life_app_routes.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  static void get navigateTo {
    Get.toNamed(Routes.forgotPassword);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          onBackButtonPressed: () {
            Get.back();
          },
        ),
        body: Center(
          child: Obx(() => Container(
            constraints: BoxConstraints(
                maxWidth: context.breakpoint > LayoutBreakpoint.xs
                    ? 500
                    : MediaQuery.of(context).size.width),
            padding: const EdgeInsets.all(AppSpacing.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      S.of(context).forgotPasswordUpperCase,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    UIHelper.verticalSpaceLarge,
                    UIHelper.verticalSpaceLarge,
                    InputTextWidget(
                      hintText: S.of(context).email,
                      onFieldSubmitted: () {},
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      errorText: controller.forgotPasswordModel.value.emailError,
                    ),],
                ),

                Column(
                  children: [
                    PrimaryButton(
                        onPressed: () => controller.performPasswordRecovery(),
                        title: S.of(context).reset,
                        width: 200,
                        color: PrimaryButtonColor.primary,
                        type: PrimaryButtonType.rounded,
                        style: PrimaryButtonStyle.filled,
                        state: Status.success),
                    UIHelper.verticalSpaceMega,
                  ],
                )
              ],
            ),
          )),
        ),
      );
}
