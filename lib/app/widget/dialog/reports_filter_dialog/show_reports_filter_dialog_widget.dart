import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/pages/my_devices/model/my_device_model.dart';
import 'package:radio_life/app/styles/app_border_radius.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';
import 'package:radio_life/app/widget/dialog/reports_filter_dialog/model/reports_filter_data.dart';
import 'package:radio_life/app/widget/text_field/dropdown_button_form_field_widget.dart';
import 'package:radio_life/app/widget/text_field/input_text_widget.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../generated/l10n.dart';

class ReportsFilterDialogWidget extends StatelessWidget {
  final ValueSetter<ReportsFilterData> onApplyFilter;
  final VoidCallback onCancel;
  List<MyDeviceModel?>? devices;
  MyDeviceModel? deviceSelected;

  ReportsFilterDialogWidget({
    required this.onApplyFilter,
    required this.onCancel,
    required this.devices,
  });

  final TextEditingController _devicesController = TextEditingController();
  final TextEditingController _testsController = TextEditingController();
  final TextEditingController _datePickerController = TextEditingController();

  Future<void> showAlert(BuildContext context) async {
    showGeneralDialog(
      barrierLabel: 'Label',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const SizedBox.expand(child: FlutterLogo()),
        ),
      ),
      transitionBuilder: (context, anim1, anim2, child) => SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
        child: child,
      ),
    );
  }

  void showCustomDialog(BuildContext context, Widget widget) {
    final height = context.size?.height ?? 500;
    showGeneralDialog(
      context: context,
      barrierLabel: 'DialogInfoF',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Container(
          height: height / 1.5,
          width: context.breakpoint > LayoutBreakpoint.xs ? 500 : double.infinity,
          // margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: widget,
          // child: Column(
          //   children: const [
          //     Text('teste'),
          //   ],
          // ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

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
              GestureDetector(
                onTap: () {
                  showCustomDialog(context, const Text('tests'));
                },
                child: AbsorbPointer(
                  child: InputTextWidget(
                    hintText: S.of(context).tests,
                    onFieldSubmitted: () {},
                    readOnly: true,
                    borderColor: AppColorScheme.primarySwatch,
                    controller: _testsController,
                    suffixIcon: const Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpaceMedium,
              GestureDetector(
                onTap: () async {
                  final result = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                    confirmText: S.of(context).confirm,
                    saveText: S.of(context).save,
                    cancelText: S.of(context).cancel,
                    builder: (BuildContext context, Widget? child) => Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.dark(
                          primary: AppColorScheme.primarySwatch,
                          onPrimary: AppColorScheme.white,
                          surface: AppColorScheme.primarySwatch,
                          onSurface: Colors.black,
                        ),
                      ),
                      child: child ?? Container(),
                    ),
                  );
                  final start = result?.start;
                  final end = result?.end;
                  if (start != null && end != null) {
                    final startDate = DateFormat(DateFormat.YEAR_MONTH_DAY).format(start);
                    final endDate = DateFormat(DateFormat.YEAR_MONTH_DAY).format(end);
                    _datePickerController.text = '$startDate - $endDate';
                  }
                },
                child: AbsorbPointer(
                  child: InputTextWidget(
                    hintText: S.of(context).datePicker,
                    onFieldSubmitted: () {},
                    readOnly: true,
                    borderColor: AppColorScheme.primarySwatch,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    controller: _datePickerController,
                    suffixIcon: const Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpaceLarge,
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
                        style: PrimaryButtonStyle.filled,
                        state: Status.success),
                  ),
                  UIHelper.horizontalSpaceSmall,
                  Flexible(
                    child: PrimaryButton(
                        onPressed: () {
                          Get.back();
                          onApplyFilter(ReportsFilterData());
                        },
                        title: 'Apply',
                        color: PrimaryButtonColor.primary,
                        type: PrimaryButtonType.circular,
                        style: PrimaryButtonStyle.bordered,
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
      selected: deviceSelected,
      borderColor: AppColorScheme.primarySwatch,
      onChanged: (dynamic newValue) {
        print('ReportsFilterDialogWidget._buildDropboxDevice: ${newValue?.name}');
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
    properties.add(ObjectFlagProperty<ValueSetter<ReportsFilterData>>.has('onApplyFilter', onApplyFilter));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onCancel', onCancel));
  }
}
