import 'package:flutter/material.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_theme.dart';

abstract class ModalHelper {
  static Future modalBottomSheet({required BuildContext context, required Widget child}) =>
      showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) => Wrap(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UIHelper.verticalSpaceSmall,
                      Container(
                        height: 6,
                        width: 80,
                        decoration: BoxDecoration(
                            color: AppColorScheme.primarySwatch.shade50.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      UIHelper.verticalSpaceMedium,
                      child,
                    ],
                  ),
                ],
              ));
}
