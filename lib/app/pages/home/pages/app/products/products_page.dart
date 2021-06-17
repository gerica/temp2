import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/platform_svg.dart';
import 'package:radio_life/app/images/app_svg_images.dart';
import 'package:radio_life/app/pages/home/pages/app/products/pages/product_details/product_details_page.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/cards/product_card_widget.dart';
import 'package:radio_life/app/widget/dialog/reports_filter_dialog/show_reports_filter_dialog_widget.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../helper/dialog_helper.dart';
import 'pages/product_details/params/product_details_params.dart';
import 'products_controller.dart';

class ProductsPage extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).products,
          backgroundColor: AppColorScheme.primarySwatch,
          onBackButtonPressed: () {
            Get.back();
          },
          actions: [
            IconButton(
              onPressed: () {
                Get.appDialog(
                  pageChild: ReportsFilterDialogWidget(
                    onApplyFilter: (filterData) {},
                    onCancel: () {},
                  ),
                );
              },
              icon: const Icon(Icons.filter_list, color: AppColorScheme.white),
            )
          ],
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(
                maxWidth: context.breakpoint > LayoutBreakpoint.xs
                    ? 800
                    : MediaQuery.of(context).size.width),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.products.length,
              itemBuilder: (context, index) => ProductCardWidget(
                onTap: () {
                  ProductDetailsPage.navigateWith(
                    params: ProductDetailsParams(product: controller.products[index]),
                  );
                },
                name: controller.products[index],
                description: '',
              ),
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.more_vert,
          activeIcon: Icons.close,
          buttonSize: 56,
          marginEnd: 30,
          visible: true,
          curve: Curves.bounceIn,
          overlayOpacity: 0.5,
          backgroundColor: AppColorScheme.pinkDark,
          foregroundColor: Colors.white,
          elevation: 8,
          shape: const CircleBorder(),
          children: [
            SpeedDialChild(
              child: Center(
                child: PlatformSvg.asset(AppSvgImages.icHome,
                    width: 25, height: 25, fit: BoxFit.contain),
              ),
              backgroundColor: AppColorScheme.pinkDark,
              onTap: () {
                Get.back();
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.add, color: AppColorScheme.white),
              backgroundColor: AppColorScheme.pinkDark,
              onTap: () {},
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      );
}
