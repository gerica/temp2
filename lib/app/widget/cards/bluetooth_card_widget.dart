import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_theme.dart';

class BluetoothDeviceCardWidget extends StatelessWidget {
  final BluetoothDevice bluetoothDevice;
  final VoidCallback onTap;
  final bool selected;

  const BluetoothDeviceCardWidget({required this.bluetoothDevice, required this.onTap, required this.selected});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: context.breakpoint > LayoutBreakpoint.xs ? 600 / 200 : MediaQuery.of(context).size.width / 130,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
        color: selected ? AppColorScheme.pinkDark : AppColorScheme.white,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          splashColor: AppColorScheme.pinkDark.withOpacity(0.1),
          child: Container(
            // color: scanResult.device.bondState.isBonded ? Colors.yellow : Colors.white,
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
                        bluetoothDevice.name,
                        style: TextStyle(color: selected ? Colors.white : Colors.black, fontSize: 15),
                      ),
                      Row(children: [
                        _chip(bluetoothDevice.type.toString()),
                        // _chip(model.locate ?? ''),
                      ]),
                      Row(children: [
                        _footer('Id', '${bluetoothDevice.id}'),
                        // _footer('Name', bluetoothDevice.name),
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
    var textFinal = text;
    if (text.length > 21) {
      textFinal = '${text.substring(0, 21)}...';
    }
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: selected ? Colors.white : Colors.black, fontSize: AppFontSize.small),
          ),
          Text(
            textFinal,
            style: TextStyle(color: selected ? Colors.white : AppColorScheme.gray1, fontSize: AppFontSize.small),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BluetoothDevice>('bluetoothDevice', bluetoothDevice));
    properties.add(DiagnosticsProperty<bool>('selected', selected));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
  }
}
