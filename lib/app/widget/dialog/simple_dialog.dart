import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
// import 'package:radio_life/app/styles/app_border_radius.dart';
// import 'package:radio_life/app/styles/app_color_scheme.dart';
// import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/styles/app_theme.dart';
import 'package:radio_life/app/widget/buttons/primary_button.dart';

import 'package:radio_life/generated/l10n.dart';

class AppSimpleDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onClosePressed;
  final VoidCallback? onOkPressed;
  final Widget? icon;

  const AppSimpleDialog({
    required this.title,
    required this.message,
    this.onClosePressed,
    this.onOkPressed,
    this.icon,
  });

  Future<void> showAlert(BuildContext context) async => showGeneralDialog(
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
              borderRadius: BorderRadius.circular(10),
            ),
            child: const SizedBox.expand(child: FlutterLogo()),
          ),
        ),
        transitionBuilder: (context, anim1, anim2, child) => SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black, fontSize: AppFontSize.medium, fontWeight: AppFontWeight.bold),
                    ),
                    if (onClosePressed != null)
                      IconButton(
                        onPressed: () {
                          Get.back();
                          onClosePressed!();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      )
                    else
                      Container()
                  ],
                ),
                Container(
                  height: 0.5,
                  color: AppColorScheme.gray1,
                  width: MediaQuery.of(context).size.width,
                ),
                UIHelper.verticalSpaceSmall,
                if (icon != null) ...[
                  icon!,
                  UIHelper.verticalSpaceSmall,
                ],
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: AppFontSize.primary),
                ),
                UIHelper.verticalSpaceMedium,
                if (onOkPressed != null)
                  PrimaryButton(
                      onPressed: () {
                        Get.back();
                        onOkPressed!();
                      },
                      title: S.of(context).ok,
                      color: PrimaryButtonColor.primary,
                      type: PrimaryButtonType.circular,
                      style: PrimaryButtonStyle.filled,
                      state: Status.success)
              ],
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback>.has('onCancel', onClosePressed));
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('message', message));
    properties.add(DiagnosticsProperty<Widget?>('icon', icon));
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onOkPressed', onOkPressed));
  }
}
