import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_images.dart';
import 'package:radio_life/app/pages/sign_in/sign_in_page.dart';
import 'package:radio_life/app/pages/sign_up/sign_up_controller.dart';
// import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import 'package:radio_life/generated/l10n.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.ready.value
          ? Scaffold(
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
              body: ListView(
                shrinkWrap: true,
                children: [
                  Center(
                    child: Obx(() => Container(
                          height: MediaQuery.of(context).size.height,
                          constraints: BoxConstraints(
                              maxWidth:
                                  context.breakpoint > LayoutBreakpoint.xs ? 1000 : MediaQuery.of(context).size.width),
                          padding: const EdgeInsets.all(AppSpacing.medium),
                          child: context.breakpoint > LayoutBreakpoint.xs
                              ? _buildWebBody(context)
                              : _buildAppBody(context),
                        )),
                  )
                ],
              ),
            )
          : Container(
              color: AppColorScheme.primarySwatch,
            ),
    );
  }

  Widget _buildAppBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          S.of(context).joinUs,
          style: const TextStyle(fontSize: AppFontSize.mega, fontWeight: AppFontWeight.regular, color: Colors.black),
        ),
        UIHelper.verticalSpaceExtraLarge,
        InputTextWidget(
          hintText: S.of(context).firstName,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          controller: controller.firstNameController,
          errorText: controller.signUpModel.value.firstNameError,
          focusNode: controller.firstNameFocus,
          onFieldSubmitted: () {
            _fieldFocusChange(context, controller.firstNameFocus, controller.lastNameFocus);
          },
          textInputAction: TextInputAction.next,
        ),
        UIHelper.verticalSpaceLarge,
        InputTextWidget(
          hintText: S.of(context).lastName,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          controller: controller.lastNameController,
          errorText: controller.signUpModel.value.lastNameError,
          focusNode: controller.lastNameFocus,
          onFieldSubmitted: () {
            _fieldFocusChange(context, controller.lastNameFocus, controller.emailFocus);
          },
          textInputAction: TextInputAction.next,
        ),
        UIHelper.verticalSpaceLarge,
        InputTextWidget(
          hintText: S.of(context).email,
          onFieldSubmitted: () {},
          keyboardType: TextInputType.emailAddress,
          controller: controller.emailController,
          errorText: controller.signUpModel.value.emailError,
          focusNode: controller.emailFocus,
        ),
        UIHelper.verticalSpaceMega,
        PrimaryButton(
            onPressed: () => controller.performSignUp(),
            title: S.of(context).signup,
            color: PrimaryButtonColor.primary,
            type: PrimaryButtonType.circular,
            style: PrimaryButtonStyle.filled,
            state: Status.success),
        UIHelper.verticalSpaceLarge,
        InkWell(
          onTap: () {
            SignInPage.navigateTo;
          },
          child: Text(
            S.of(context).haveAnAccountSignIn,
            style: TextStyle(color: AppColorScheme.blue, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildWebBody(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).signUpCamelCase,
                style: const TextStyle(fontSize: AppFontSize.mega, fontWeight: AppFontWeight.bold, color: Colors.black),
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
              UIHelper.verticalSpaceLarge,
              PrimaryButton(
                  onPressed: () => controller.performSignUp(),
                  title: S.of(context).signup,
                  color: PrimaryButtonColor.primary,
                  type: PrimaryButtonType.circular,
                  style: PrimaryButtonStyle.filled,
                  state: Status.success),
              UIHelper.verticalSpaceLarge,
              InkWell(
                onTap: () {
                  SignInPage.navigateTo;
                },
                child: Text(
                  S.of(context).haveAnAccountSignIn,
                  style: TextStyle(color: AppColorScheme.blue, fontSize: 16),
                ),
              ),
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

  void _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
