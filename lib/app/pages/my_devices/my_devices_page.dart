import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/cards/device_card_widget.dart';
import 'package:radio_life/app/widget/dialog/reports_filter_dialog/show_reports_filter_dialog_widget.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';

import '../../../../../../generated/l10n.dart';
import '../../helper/dialog_helper.dart';
import 'my_devices_controller.dart';

class MyDevicesPage extends GetView<MyDevicesController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: false,
          brightness: Brightness.dark,
          titleText: S.of(context).myDevices,
          backgroundColor: AppColorScheme.primarySwatch,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.addNewDevice);
              },
              icon: const Icon(Icons.add, color: AppColorScheme.white),
            ),
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
            ),
          ],
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(
                maxWidth: context.breakpoint > LayoutBreakpoint.xs
                    ? 600
                    : MediaQuery.of(context).size.width),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.devices.length,
              itemBuilder: (context, index) => DeviceCardWidget(
                onTap: () {},
                name: controller.devices[index],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 1,
        ),
      );
}
