import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../generated/l10n.dart';
import 'auto_scan_controller.dart';

class AutoScanPage extends GetView<AutoScanController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).autoScan,
          backgroundColor: AppColorScheme.primarySwatch,
          onBackButtonPressed: () {
            Get.back();
          },
        ),
        body: Container(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: Obx(
            () => controller.bluetoothState.value == BluetoothState.off
                ? _enableBluetoothWarning
                : controller.bluetoothState.value == BluetoothState.on
                    ? Obx(() {
                        final data = controller.state.value.data;
                        final error = controller.state.value.error;
                        return controller.state.value.status == Status.loading
                            ? Center(
                                child: Lottie.asset('assets/loading/loading_scan.json'),
                              )
                            : controller.state.value.status == Status.success
                                ? data != null && data.isEmpty
                                    ? _emptyBluetoothDevicesWidget
                                    : ListView.builder(
                                        itemCount: data?.length ?? 0,
                                        itemBuilder: (context, index) {
                                          if (data == null) return Container();
                                          final item = data[index];
                                          return Container(
                                            child: Text(item.device.name),
                                          );
                                        },
                                      )
                                : Container(
                                    child: Text(error?.title ?? ''),
                                  );
                      })
                    : Container(),
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 1,
        ),
      );

  Widget get _enableBluetoothWarning => Container(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.current.bluetoothDesativado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: AppFontSize.large,
                color: Colors.black,
              ),
            ),
            UIHelper.verticalSpaceLarge,
            Text(
              S.current.enableBluetoothMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      );

  Widget get _emptyBluetoothDevicesWidget => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.current.noBluetoothDeviceFound,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: AppFontSize.large,
                color: Colors.black,
              ),
            ),
            UIHelper.verticalSpaceLarge,
            PrimaryButton(
                onPressed: () => controller.startScan(),
                title: S.current.refresh,
                color: PrimaryButtonColor.primary,
                type: PrimaryButtonType.circular,
                style: PrimaryButtonStyle.filled,
                state: Status.success)
          ],
        ),
      );
}
