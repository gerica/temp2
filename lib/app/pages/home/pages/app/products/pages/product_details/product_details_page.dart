import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/platform_svg.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_images.dart';
import 'package:radio_life/app/images/app_svg_images.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../../../../generated/l10n.dart';
import 'params/product_details_params.dart';
import 'product_details_controller.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  static Future? navigateWith({required ProductDetailsParams params}) =>
      Get.toNamed(Routes.productDetails, arguments: params);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).products,
          backgroundColor: AppColorScheme.primarySwatch,
          title: Obx(
            () => Text(
              controller.state.value.data?.title ?? '',
              style: const TextStyle(color: AppColorScheme.white),
            ),
          ),
          onBackButtonPressed: () {
            Get.back();
          },
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.medium),
            constraints: BoxConstraints(
                maxWidth: context.breakpoint > LayoutBreakpoint.xs
                    ? 500
                    : MediaQuery.of(context).size.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...[
                  Image.asset(AppImages.productImage),
                  UIHelper.verticalSpaceMedium,
                  Text(
                    S.of(context).loremIpsum,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: AppFontSize.secondary,
                    ),
                  )
                ],
                const Spacer(),
                ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          S.of(context).faqUpperCase,
                          style:
                              TextStyle(color: AppColorScheme.blue, fontSize: AppFontSize.primary),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          PlatformSvg.asset(AppSvgImages.icDownload),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              S.of(context).downloadManual,
                              style: TextStyle(
                                  color: AppColorScheme.blue, fontSize: AppFontSize.primary),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  UIHelper.verticalSpaceLarge,
                  PrimaryButton(
                      onPressed: () {},
                      title: S.of(context).buyNow,
                      color: PrimaryButtonColor.secondary,
                      type: PrimaryButtonType.circular,
                      style: PrimaryButtonStyle.filled,
                      state: Status.success)
                ]
              ],
            ),
          ),
        ),
      );
}
