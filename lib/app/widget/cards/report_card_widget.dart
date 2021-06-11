import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/platform_svg.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/images/app_svg_images.dart';
import 'package:radio_life/app/styles/app_theme.dart';

class ReportCardWidget extends StatelessWidget {
  final String name;
  final String status;
  final Color color;
  final VoidCallback onTap;

  const ReportCardWidget({
    required this.name,
    required this.status,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: context.breakpoint > LayoutBreakpoint.xs
            ? 600/150
            : MediaQuery.of(context).size.width / 130,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            splashColor: AppColorScheme.primarySwatch.withOpacity(0.1),
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: 8,
                    decoration: BoxDecoration(
                      color: AppColorScheme.accentColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 25,
                      child: Center(
                          child: PlatformSvg.asset(
                        AppSvgImages.icReports,
                        color: AppColorScheme.accentColor,
                      )),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '23/04/2022',
                            style:
                                TextStyle(color: AppColorScheme.gray1, fontSize: AppFontSize.small),
                          ),
                          Text(
                            name,
                            style:
                                const TextStyle(color: Colors.black, fontSize: AppFontSize.primary),
                          ),
                          Text(
                            'José Carlos da Silva',
                            style:
                                TextStyle(color: AppColorScheme.gray1, fontSize: AppFontSize.small),
                          ),
                          UIHelper.verticalSpaceMini,
                          Row(children: [
                            _chip('Covid-19'),
                            _chip('São Paulo'),
                            _chip(status, color: color),
                          ]),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget _chip(String text, {Color? color}) => Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        decoration: BoxDecoration(
          color: color ?? AppColorScheme.blueLight,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: color != null && color == AppColorScheme.success
                  ? AppColorScheme.white
                  : Colors.black,
              fontSize: AppFontSize.small),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('name', name));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
    properties.add(StringProperty('status', status));
    properties.add(ColorProperty('color', color));
  }
}
