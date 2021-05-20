import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_images.dart';
import 'package:radio_life/app/pages/sign_in/sign_in_page.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../generated/l10n.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          title: SizedBox(
            height: 50,
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                AppImages.logoHorizontalColor,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          showBackButton: false,
          centerTitle: true,
          leadingWidth: 0,
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ',
                          style: TextStyle(
                              color: AppColorScheme.textPrimary, fontSize: AppFontSize.ultra),
                        ),
                        Text(
                          'Denis',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColorScheme.primarySwatch,
                              fontSize: AppFontSize.ultra),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpaceMega,
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 140 / 140,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 5
                      ),
                      itemCount: controller.items.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        elevation: 4,
                        child: InkWell(
                          onTap: () {},
                          splashColor: AppColorScheme.primarySwatch.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.medium),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Placeholder(),
                                ),
                                Text(
                                  controller.items[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColorScheme.primarySwatch),
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
