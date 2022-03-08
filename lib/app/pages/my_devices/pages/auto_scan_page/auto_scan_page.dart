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
import 'package:radio_life/app/widget/cards/bluetooth_card_widget.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/core/data/enum/status.dart';

import 'package:radio_life/generated/l10n.dart';
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
    if (controller.bluetoothState.value == BluetoothState.off) {
      return _enableBluetoothWarning;
    } else if (controller.bluetoothState.value == BluetoothState.on) {
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
    final listBluetooth = controller.state.value.data as List<BluetoothDevice>;
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
              _buildSearchButton(),
              UIHelper.verticalSpaceExtraLarge,
              InkWell(
                onTap: () async {
                  if (controller.deviceSelected()) {
                    await controller.connectToDevice();
                  }
                },
                child: Text(
                  S.current.configureWifi,
                  style: TextStyle(
                      color: controller.deviceSelected() ? AppColorScheme.primarySwatch : AppColorScheme.gray1,
                      fontWeight: AppFontWeight.bold),
                ),
              ),
              UIHelper.verticalSpaceMedium,
            ],
          )
        ],
      ),
    );
  }

  Widget renderList(List<BluetoothDevice> listBluetooth) {
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
        return Obx(() => BluetoothDeviceCardWidget(
            onTap: () async {
              controller.selectDevice(index);
            },
            selected: controller.indexDevice.value == index,
            bluetoothDevice: listBluetooth[index]));
      },
    );
  }

  Widget _buildSearchButton() {
    if (controller.isScanning.value) {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(RadiolifeThemeColors.pink),
      );
    }
    return PrimaryButton(
      title: S.current.searchDevices,
      color: PrimaryButtonColor.primary,
      type: PrimaryButtonType.circular,
      style: PrimaryButtonStyle.filled,
      state: Status.success,
      onPressed: () {
        controller.startScan();
      },
    );
  }
}
