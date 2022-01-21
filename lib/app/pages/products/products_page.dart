import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/pages/products/pages/product_details/product_details_page.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/cards/product_card_widget.dart';
import 'package:radio_life/app/widget/dialog/reports_filter_dialog_widget.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';

import '../../../generated/l10n.dart';
import '../../helper/dialog_helper.dart';
import 'pages/product_details/params/product_details_params.dart';
import 'products_controller.dart';

class ProductsPage extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: false,
          brightness: Brightness.dark,
          titleText: S.of(context).products,
          backgroundColor: AppColorScheme.primarySwatch,
          actions: [
            IconButton(
              onPressed: () {
                Get.appDialog(
                  pageChild: ReportsFilterDialogWidget(
                    devices: const [],
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
                maxWidth: context.breakpoint > LayoutBreakpoint.xs ? 800 : MediaQuery.of(context).size.width),
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
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 0,
        ),
      );
}
