import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_theme.dart';

class BluetoothDeviceCardWidget extends StatelessWidget {
  final BluetoothDiscoveryResult scanResult;
  final VoidCallback onTap;

  const BluetoothDeviceCardWidget({required this.scanResult, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: context.breakpoint > LayoutBreakpoint.xs ? 600 / 200 : MediaQuery.of(context).size.width / 130,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          splashColor: AppColorScheme.pinkDark.withOpacity(0.1),
          child: Container(
            color: scanResult.device.bondState.isBonded ? Colors.yellow : Colors.white,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColorScheme.pinkDark,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    // child: Center(child: PlatformSvg.asset(AppSvgImages.icTrophy)),
                    child: const Center(child: Icon(Icons.bluetooth, size: 40, color: Colors.white)),
                    // child: Icon(Icons.error_outline, size: 50, color: AppColorScheme.error),
                  ),
                ),
                UIHelper.horizontalSpaceSmall,
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        scanResult.device.name == null ? 'Empty' : scanResult.device.name as String,
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Row(children: [
                        _chip(scanResult.device.type.toString()),
                        // _chip(model.locate ?? ''),
                      ]),
                      Row(children: [
                        _footer('Rssi', scanResult.rssi.toString()),
                        _footer('Address', scanResult.device.address),
                      ]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(color: AppColorScheme.blueLight, borderRadius: BorderRadius.circular(4)),
      child: Text(
        text,
        style: TextStyle(
          color: AppColorScheme.textPrimary,
          fontSize: AppFontSize.small,
        ),
      ),
    );
  }

  Widget _footer(String label, String text) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: AppFontSize.small),
          ),
          Text(
            text,
            style: TextStyle(color: AppColorScheme.gray1, fontSize: AppFontSize.small),
          ),
        ],
      ),
    );
  }
}
