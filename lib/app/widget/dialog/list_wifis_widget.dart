import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/core/data/enum/status.dart';

import 'package:radio_life/generated/l10n.dart';

import 'package:wifi_scan/wifi_scan.dart';

/// Example app for wifi_scan plugin.
class ListWifisWidget extends StatefulWidget {
  ValueSetter<String> onSelected;

  ListWifisWidget({required this.onSelected});

  @override
  State<ListWifisWidget> createState() => _ListWifisWidgetpState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<ValueSetter<String>>.has('onSelected', onSelected));
  }
}

class _ListWifisWidgetpState extends State<ListWifisWidget> {
  bool shouldCheck = true;
  List<WiFiAccessPoint> accessPoints = <WiFiAccessPoint>[];
  StreamSubscription<List<WiFiAccessPoint>>? subscription;

  bool get isStreaming => subscription != null;

  Future<bool> _canGetScannedResults(BuildContext context) async {
    if (shouldCheck) {
      // check if can-getScannedResults
      final can = await WiFiScan.instance.canGetScannedResults();
      // if can-not, then show error
      if (can != CanGetScannedResults.yes) {
        accessPoints = <WiFiAccessPoint>[];
        return false;
      }
    }
    return true;
  }

  Future<void> _getScannedResults(BuildContext context) async {
    if (await _canGetScannedResults(context)) {
      // get scanned results
      final listWifis = await WiFiScan.instance.getScannedResults();
      final results = listWifis.where((e) {
        return e.frequency < 3000;
      }).toList();

      setState(() => accessPoints = results);
    }
  }

  void _stopListteningToScanResults() {
    subscription?.cancel();
    // setState(() => subscription = null);
  }

  @override
  void initState() {
    super.initState();
    // fetch getScannedResults post first build
    WidgetsBinding.instance?.addPostFrameCallback((_) => _getScannedResults(context));
  }

  @override
  void dispose() {
    super.dispose();
    // stop subscription for scanned results
    _stopListteningToScanResults();
  }

  // @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: Center(
        child: Container(
          width: context.breakpoint > LayoutBreakpoint.xs ? 500 : double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
          padding: const EdgeInsets.all(AppSpacing.medium),
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.medium,
            color: AppColorScheme.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                  ),
                  const Text(
                    'List Wifis',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: AppFontSize.medium, fontWeight: AppFontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                      // onClosePressed!();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Container(
                height: 0.5,
                color: AppColorScheme.gray1,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: accessPoints.length,
                  itemBuilder: (context, i) {
                    final ap = accessPoints[i];
                    final title = ap.ssid.isNotEmpty ? ap.ssid : '**EMPTY**';
                    final signalIcon = ap.level >= -80 ? Icons.signal_wifi_4_bar : Icons.signal_wifi_0_bar;
                    return ListTile(
                      visualDensity: VisualDensity.compact,
                      leading: Icon(signalIcon),
                      title: Text(title),
                      onTap: () {
                        widget.onSelected(ap.ssid);
                        Get.back();
                      },
                    );
                  },
                ),
              ),
              UIHelper.verticalSpaceMedium,
              _buildButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: PrimaryButton(
              onPressed: () {
                Get.back();
                // onCancel();
              },
              title: S.of(context).cancel,
              color: PrimaryButtonColor.primary,
              type: PrimaryButtonType.circular,
              style: PrimaryButtonStyle.bordered,
              state: Status.success),
        ),
        UIHelper.horizontalSpaceSmall,
        Flexible(
          child: PrimaryButton(
              onPressed: () {
                Get.back();
                // onApplyFilter();
              },
              title: 'Apply',
              color: PrimaryButtonColor.primary,
              type: PrimaryButtonType.circular,
              style: PrimaryButtonStyle.filled,
              state: Status.success),
        )
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('shouldCheck', shouldCheck));
    properties.add(IterableProperty<WiFiAccessPoint>('accessPoints', accessPoints));
    properties.add(DiagnosticsProperty<StreamSubscription<List<WiFiAccessPoint>>?>('subscription', subscription));
    properties.add(DiagnosticsProperty<bool>('isStreaming', isStreaming));
  }
}
