import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/cards/product_card_widget.dart';

import '../../../../../generated/l10n.dart';
import 'products_controller.dart';

class ProductsPage extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).products,
          backgroundColor: AppColorScheme.accentColor,
          onBackButtonPressed: () {
            Get.back();
          },
          actions: [
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.filter_list, color: AppColorScheme.white)
            )
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),

          itemCount: controller.products.length,
          itemBuilder: (context, index) => ProductCardWidget(
            onTap: () {},
            name: controller.products[index],
            description: '',
          ),
        ),
      );
}
