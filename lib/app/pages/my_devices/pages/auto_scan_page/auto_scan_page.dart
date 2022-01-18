import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/cards/bluetooth_card_widget.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../generated/l10n.dart';
import 'auto_scan_controller.dart';

class AutoScanPage extends GetView<AutoScanController> {
  Widget build(BuildContext context) {
    return Scaffold(
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
        // child: const Text('Teste'),
        // child: Obx(() => Container()),
        child: Obx(() => _containerBluetooth),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(
        currentIndex: 0,
      ),
    );
  }

  Widget get _containerBluetooth {
    if (controller.bluetoothState.value == BluetoothState.STATE_OFF) {
      return _enableBluetoothWarning;
    } else if (controller.bluetoothState.value == BluetoothState.STATE_ON) {
      return _showDevice;
    }

    return Container();
  }

  Widget get _showDevice {
    switch (controller.state.value.status) {
      case Status.loading:
        return Center(
          child: Lottie.asset('assets/loading/loading_scan.json'),
        );

      case Status.success:
        return _deviceFoundWidget;
      default:
        return Container(child: Text(controller.state.value.error?.title ?? ''));
    }
    // return const SizedBox.shrink();
  }

  Widget get _enableBluetoothWarning {
    return Container(
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
  }

  Widget get _deviceFoundWidget {
    final listBluetooth = controller.state.value.data as List<BluetoothDiscoveryResult>;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 320,
                child: renderList(listBluetooth),
              ),
            ],
          ),
          Column(
            children: [
              PrimaryButton(
                title: S.current.searchDevices,
                color: PrimaryButtonColor.primary,
                type: PrimaryButtonType.circular,
                style: PrimaryButtonStyle.filled,
                state: Status.success,
                onPressed: () {
                  controller.startScan();
                },
              ),
              UIHelper.verticalSpaceExtraLarge,
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.configureWiFi);
                },
                child: Text(
                  S.current.configureWifi,
                  style: TextStyle(color: AppColorScheme.primarySwatch, fontWeight: AppFontWeight.bold),
                ),
              ),
              UIHelper.verticalSpaceMedium,
            ],
          )
        ],
      ),
    );
  }

  Widget renderList(List<BluetoothDiscoveryResult> listBluetooth) {
    if (listBluetooth.isEmpty) {
      return Container(
        child: Text(
          S.current.emptyList,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: AppFontSize.large,
            color: Colors.black,
          ),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true, //
      padding: const EdgeInsets.all(16),
      itemCount: listBluetooth.length,
      itemBuilder: (context, index) {
        return BluetoothDeviceCardWidget(
            onTap: () async {
              controller.connectToDevice(listBluetooth[index]);
            },
            scanResult: listBluetooth[index]);
      },
    );
  }
}
