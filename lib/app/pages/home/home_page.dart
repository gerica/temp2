import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/platform_svg.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_images.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';

import '../../../generated/l10n.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: false,
          leadingWidth: 0,
          title: Hero(
            tag: 'logo',
            child: Image.asset(AppImages.logoHorizontalColor, height: 40),
          ),
          centerTitle: false,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: context.breakpoint > LayoutBreakpoint.xs
                        ? 500
                        : MediaQuery.of(context).size.width),
                padding: const EdgeInsets.all(AppSpacing.medium),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [Text(
                            S.of(context).hello,
                            style: TextStyle(
                                color: AppColorScheme.textPrimary, fontSize: AppFontSize.mega),
                          ),
                            Text(
                              ' Denis',
                              style: TextStyle(
                                  color: AppColorScheme.primarySwatch, fontSize: AppFontSize.mega),
                            )],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(AppImages.avatar2),
                        )
                      ],
                    ),
                    UIHelper.verticalSpaceLarge,
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 140 / 140,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 5),
                      itemCount: controller.items.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 2,
                        child: InkWell(
                          onTap: () => controller.navigateTo(index),
                          splashColor: AppColorScheme.primarySwatch.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.medium),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                PlatformSvg.asset(controller.icons[index], fit: BoxFit.contain),
                                Text(
                                  controller.items[index],
                                  style: TextStyle(color: AppColorScheme.textPrimary),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
