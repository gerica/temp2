import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_font_weight.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/cards/device_card_widget.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';

import '../../../../../generated/l10n.dart';
import 'support_controller.dart';

class SupportPage extends GetView<SupportController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).support,
          backgroundColor: AppColorScheme.primarySwatch,
          onBackButtonPressed: () {
            Get.back();
          },
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list, color: AppColorScheme.white),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpaceLarge,
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
              Flexible(
                child: InputTextWidget(
                  hintText: S.of(context).yourMessage,
                  onFieldSubmitted: () {},
                  keyboardType: TextInputType.multiline,
                  minLines: 7,
                  maxLines: 7,
                  controller: controller.helpMessageController,
                  errorText: null,
                ),
              ),
            ],
          ),
        ),
      );
}
