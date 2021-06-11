import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/platform_svg.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_svg_images.dart';
import 'package:radio_life/app/styles/app_theme.dart';

class DeviceCardWidget extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const DeviceCardWidget({required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: context.breakpoint > LayoutBreakpoint.xs
            ? 600/200
            : MediaQuery.of(context).size.width / 130,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            splashColor: AppColorScheme.pinkDark.withOpacity(0.1),
            child: Container(
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
                      child: Center(child: PlatformSvg.asset(AppSvgImages.icTrophy)),
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
                          name,
                          style:
                              const TextStyle(color: Colors.black, fontSize: AppFontSize.primary),
                        ),
                        Row(children: [
                          _chip('Covid-19'),
                          _chip('São Paulo'),
                        ]),
                        Row(children: [
                          _footer('Bar Code', '123455'),
                          _footer('Data', '22 de Março'),
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

  Widget _chip(String text) => Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        decoration:
            BoxDecoration(color: AppColorScheme.blueLight, borderRadius: BorderRadius.circular(4)),
        child: Text(
          text,
          style: TextStyle(
            color: AppColorScheme.textPrimary,
            fontSize: AppFontSize.small,
          ),
        ),
      );

  Widget _footer(String label, String text) => Container(
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('name', name));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
  }
}
