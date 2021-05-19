import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_images.dart';
import 'package:radio_life/app/pages/forgot_password/forgot_password_page.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../generated/l10n.dart';
import 'sign_in_controller.dart';

class SignInPage extends GetView<SignInController> {
  static void get navigateTo {
    Get.toNamed(Routes.signIn);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                  children: [
                    Center(
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset(AppImages.icon, width: 100),
                      ),
                    ),
                    UIHelper.verticalSpaceLarge,
                    Text(
                      S.of(context).welcomeBack,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    UIHelper.verticalSpaceLarge,
                    InputTextWidget(
                      hintText: S.of(context).email,
                      onFieldSubmitted: () {},
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      errorText: controller.signInModel.value.emailError,
                    ),
                    UIHelper.verticalSpaceMedium,
                    InputTextWidget(
                      hintText: S.of(context).password,
                      onFieldSubmitted: () {},
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      controller: controller.pwdController,
                      errorText: controller.signInModel.value.passwordError,
                    ),
                    TextButton(
                      onPressed: () {
                        ForgotPasswordPage.navigateTo;
                      },
                      child: Text(
                        S.of(context).forgotPassword,
                        style: TextStyle(color: AppColorScheme.textPrimary),
                      ),
                    ),
                    UIHelper.verticalSpaceMega,
                    PrimaryButton(
                        onPressed: () => controller.performSignIn(),
                        title: S.of(context).login,
                        width: 200,
                        color: PrimaryButtonColor.primary,
                        type: PrimaryButtonType.rounded,
                        style: PrimaryButtonStyle.filled,
                        state: Status.success)
                  ],
                ),
              )),
        ),
      );
}
