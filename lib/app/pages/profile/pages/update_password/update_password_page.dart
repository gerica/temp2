import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/pages/profile/pages/update_password/update_password_controller.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/flavors/flavor_values.dart';

import 'package:radio_life/generated/l10n.dart';

class UpdatePasswordPage extends GetView<UpdatePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).password,
          backgroundColor: FlavorConfig.instance.color,
          onBackButtonPressed: () {
            Get.back();
          }),
      body: Container(
        padding: const EdgeInsets.all(AppSpacing.medium),
        constraints: BoxConstraints(
            maxWidth: context.breakpoint > LayoutBreakpoint.xs ? 500 : MediaQuery.of(context).size.width),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UIHelper.verticalSpaceLarge,
              _buildImage(),
              UIHelper.verticalSpaceLarge,
              ..._buildForm(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(
        currentIndex: 3,
      ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: Hero(
        tag: 'avatar',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Obx(
            () {
              final file = controller.image.value;
              final url = controller.imageUrl.value;
              if (url != null && file == null)
                return Image.network(
                  url,
                  fit: BoxFit.cover,
                  height: 90,
                  width: 90,
                );
              return file == null
                  ? Container(
                      height: 90,
                      width: 90,
                      color: AppColorScheme.lightGray,
                      child: const Icon(Icons.person, size: 50),
                    )
                  : Image.memory(
                      file.readAsBytesSync(),
                      fit: BoxFit.cover,
                      height: 90,
                      width: 90,
                    );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildForm(BuildContext context) {
    final List<Widget> result = [];

    result.add(Text(
      S.of(context).updatePassword,
      style: const TextStyle(
        color: Colors.black,
      ),
    ));
    result.add(UIHelper.verticalSpaceMedium);
    result.add(
      InputTextWidget(
        hintText: S.of(context).currentPassword,
        focusNode: controller.currentPasswordFocus,
        onFieldSubmitted: () {
          _fieldFocusChange(context, controller.currentPasswordFocus, controller.newPasswordFocus);
        },
        keyboardType: TextInputType.text,
        obscureText: true,
        textCapitalization: TextCapitalization.words,
        controller: controller.currentPasswordController,
        errorText: null,
        textInputAction: TextInputAction.next,
      ),
    );

    result.add(UIHelper.verticalSpaceMedium);
    result.add(InputTextWidget(
      hintText: S.of(context).newPassword,
      focusNode: controller.newPasswordFocus,
      onFieldSubmitted: () {
        _fieldFocusChange(context, controller.newPasswordFocus, controller.confirmPasswordFocus);
      },
      keyboardType: TextInputType.text,
      obscureText: true,
      textCapitalization: TextCapitalization.words,
      controller: controller.newPasswordController,
      errorText: null,
      textInputAction: TextInputAction.next,
    ));
    result.add(UIHelper.verticalSpaceMedium);
    result.add(
      InputTextWidget(
        hintText: S.of(context).confirmPassword,
        focusNode: controller.confirmPasswordFocus,
        onFieldSubmitted: () {},
        obscureText: true,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        controller: controller.confirmPasswordController,
        errorText: null,
      ),
    );
    result.add(UIHelper.verticalSpaceLarge);
    result.add(PrimaryButton(
        onPressed: () => controller.updatePassword(),
        title: S.of(context).updatePassword,
        color: PrimaryButtonColor.primary,
        type: PrimaryButtonType.circular,
        style: PrimaryButtonStyle.filled,
        state: Status.success));
    return result;
  }

  void _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
