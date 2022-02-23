import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/pages/my_devices/pages/my_device_detail/my_device_detail_page.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/cards/device_card_widget.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';

import 'package:radio_life/generated/l10n.dart';
import 'my_devices_controller.dart';

class MyDevicesPage extends GetView<MyDevicesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RadioLifeAppBarWidget(
        showBackButton: false,
        brightness: Brightness.dark,
        titleText: S.of(context).myDevices,
        backgroundColor: AppColorScheme.primarySwatch,
        actions: [
          IconButton(
            onPressed: () async {
              await Get.toNamed(Routes.addNewDevice);
              controller.getMyDevices();
            },
            icon: const Icon(Icons.add, color: AppColorScheme.white),
          ),
          IconButton(
            onPressed: () => controller.openFilterDialog(),
            icon: const Icon(Icons.filter_list, color: AppColorScheme.white),
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
              maxWidth: context.breakpoint > LayoutBreakpoint.xs ? 600 : MediaQuery.of(context).size.width),
          child: Obx(() {
            final response = controller.state.value;
            final data = response.data;
            if (response.status == Status.success && data != null) {
              return data.isEmpty
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).youHaveNoDevices,
                            style: const TextStyle(color: Colors.black),
                          ),
                          UIHelper.verticalSpaceMedium,
                          PrimaryButton(
                            onPressed: () {
                              Get.toNamed(Routes.addNewDevice);
                            },
                            title: S.of(context).registerNewDevice,
                            color: PrimaryButtonColor.primary,
                            type: PrimaryButtonType.circular,
                            style: PrimaryButtonStyle.filled,
                            state: Status.success,
                          )
                        ],
                      ),
                    )
                  : _buildList(data);
            } else
              return Container();
          }),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(
        currentIndex: 0,
      ),
    );
  }

  Widget _buildList(List<MyDeviceEntity?> data) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      itemBuilder: (context, index) => data[index] != null
          ? DeviceCardWidget(
              onTap: () async {
                MyDeviceDetailPage.navigateWith(
                  params: data[index]!,
                );
              },
              model: data[index]!,
            )
          : Container(),
    );
  }
}
