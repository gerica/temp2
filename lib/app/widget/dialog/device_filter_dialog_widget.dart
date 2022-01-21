import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/pages/my_devices/model/device_filter_model.dart';
import 'package:radio_life/app/pages/my_devices/model/my_device_model.dart';
import 'package:radio_life/app/styles/app_border_radius.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/text_field/dropdown_button_form_field_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../generated/l10n.dart';

class DeviceFilterDialogWidget extends StatelessWidget {
  // final ValueSetter<dynamic> onApplyFilter;
  final VoidCallback onApplyFilter;
  final VoidCallback onCancel;
  List<MyDeviceModel?>? devices;
  DeviceFilter deviceFilter;

  DeviceFilterDialogWidget({
    required this.onApplyFilter,
    required this.onCancel,
    required this.devices,
    required this.deviceFilter,
  });

  @override
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
              _buildItemDevice(context),
              UIHelper.verticalSpaceMedium,
              Row(
                children: [
                  Flexible(
                    child: PrimaryButton(
                        onPressed: () {
                          Get.back();
                          onCancel();
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
                          onApplyFilter();
                        },
                        title: 'Apply',
                        color: PrimaryButtonColor.primary,
                        type: PrimaryButtonType.circular,
                        style: PrimaryButtonStyle.filled,
                        state: Status.success),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDevice(BuildContext context) {
    return DropdownButtonFormFieldWidget(
      hintText: S.of(context).devices,
      selected: deviceFilter.device,
      borderColor: AppColorScheme.primarySwatch,
      onChanged: (dynamic newValue) {
        deviceFilter.device = newValue;
      },
      itens: devices!.map((dynamic value) {
        return DropdownMenuItem<dynamic>(
          value: value,
          child: Text(value?.name ?? ''),
        );
      }).toList(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback>.has('onCancel', onCancel));
  }
}
