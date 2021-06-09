import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/platform_svg.dart';
import 'package:radio_life/app/images/app_svg_images.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/cards/device_card_widget.dart';

import '../../../../../generated/l10n.dart';
import '../../../../radio_life_app_routes.dart';
import 'my_devices_controller.dart';

class MyDevicesPage extends GetView<MyDevicesController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).myDevices,
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
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.devices.length,
          itemBuilder: (context, index) => DeviceCardWidget(
            onTap: () {},
            name: controller.devices[index],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.offNamed(Routes.home);
          },
          backgroundColor: AppColorScheme.pinkDark,
          child: PlatformSvg.asset(AppSvgImages.icHome),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      );
}
