import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_images.dart';
import 'package:radio_life/app/pages/sign_in/sign_in_page.dart';
import 'package:radio_life/app/pages/sign_up/sign_up_controller.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../generated/l10n.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Obx(() => Container(
                constraints: BoxConstraints(
                    maxWidth: context.breakpoint > LayoutBreakpoint.xs
                        ? 500
                        : MediaQuery.of(context).size.width),
                padding: const EdgeInsets.all(AppSpacing.medium),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UIHelper.verticalSpaceLarge,
                      Center(
                        child: Hero(
                          tag: 'logo',
                          child: Image.asset(AppImages.icon, width: 70),
                        ),
                      ),
                      UIHelper.verticalSpaceLarge,
                      Text(
                        S.of(context).joinUs,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      UIHelper.verticalSpaceLarge,
                      InputTextWidget(
                        hintText: S.of(context).firstName,
                        onFieldSubmitted: () {},
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        controller: controller.firstNameController,
                        errorText: controller.signUpModel.value.firstNameError,
                      ),
                      UIHelper.verticalSpaceLarge,
                      InputTextWidget(
                        hintText: S.of(context).lastName,
                        onFieldSubmitted: () {},
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        controller: controller.lastNameController,
                        errorText: controller.signUpModel.value.lastNameError,
                      ),
                      UIHelper.verticalSpaceLarge,
                      InputTextWidget(
                        hintText: S.of(context).email,
                        onFieldSubmitted: () {},
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        errorText: controller.signUpModel.value.emailError,
                      ),
                      UIHelper.verticalSpaceMedium,
                      InputTextWidget(
                        hintText: S.of(context).password,
                        onFieldSubmitted: () {},
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        controller: controller.pwdController,
                        errorText: controller.signUpModel.value.passwordError,
                      ),
                      UIHelper.verticalSpaceLarge,
                      PrimaryButton(
                          onPressed: () => controller.performSignUp(),
                          title: S.of(context).signup,
                          width: 200,
                          color: PrimaryButtonColor.primary,
                          type: PrimaryButtonType.rounded,
                          style: PrimaryButtonStyle.filled,
                          state: Status.success),
                      UIHelper.verticalSpaceMedium,
                      Text(
                        S.of(context).alreadyHaveAnAccount,
                        style: TextStyle(color: AppColorScheme.textPrimary),
                      ),
                      TextButton(
                        onPressed: () {
                          SignInPage.navigateTo;
                        },
                        child: Text(
                          S.of(context).signinInstead,
                          style: TextStyle(color: AppColorScheme.blue, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      );
}
