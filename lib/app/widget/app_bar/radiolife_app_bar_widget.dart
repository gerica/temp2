import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radio_life/app/styles/app_spacing.dart';

import '../../styles/app_color_scheme.dart';

class RadioLifeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final Widget? backButtonIcon;
  final String? titleText;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final Widget? title;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? backgroundColor;
  final Color? backButtonColor;
  final Brightness? brightness;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final TextTheme? textTheme;
  final bool excludeHeaderSemantics;
  final double bottomOpacity;
  final bool centerTitle;
  final bool hideTitle;
  final bool showBackButton;
  final double? leadingWidth;
  final VoidCallback? onBackButtonPressed;

  // ignore: diagnostic_describe_all_properties
  final bool roundedBorder;

  // ignore: diagnostic_describe_all_properties
  final bool invertColors;
  final TextStyle? style;

  const RadioLifeAppBarWidget({
    Key? key,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.leadingWidth,
    this.invertColors = false,
    this.flexibleSpace,
    this.backButtonIcon,
    this.roundedBorder = true,
    this.bottom,
    this.title,
    this.titleText,
    this.elevation,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.hideTitle = true,
    this.backButtonColor,
    this.actionsIconTheme,
    this.textTheme,
    this.centerTitle = false,
    this.showBackButton = false,
    this.excludeHeaderSemantics = false,
    this.onBackButtonPressed,
    this.bottomOpacity = 1.0,
    this.style,
  })  : assert(elevation == null || elevation >= 0.0),
        super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        elevation: elevation ?? 0,
        backgroundColor: backgroundColor ?? AppColorScheme.background,
        leadingWidth: leadingWidth,
        leading: showBackButton
            ? backButtonIcon != null
                ? InkWell(
                    onTap: onBackButtonPressed,
                    child: Container(
                      margin: const EdgeInsets.only(left: AppSpacing.medium),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: backButtonIcon,
                      ),
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: backButtonColor ?? AppColorScheme.textPrimary,
                    ),
                    onPressed: onBackButtonPressed,
                  )
            : Container(
                width: 0,
                height: 0,
              ),
        automaticallyImplyLeading: false,
        flexibleSpace: flexibleSpace,
        actions: actions,
        title: title,
        iconTheme: iconTheme,
        actionsIconTheme: actionsIconTheme,
        textTheme: textTheme,
        centerTitle: centerTitle,
        excludeHeaderSemantics: excludeHeaderSemantics,
        bottomOpacity: bottomOpacity,
      );

  @override
  Size get preferredSize =>
      Size.fromHeight(hideTitle ? kToolbarHeight : height + (bottom?.preferredSize.height ?? 0.0));

  double get height => showBackButton == true ? 84 : 70;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<bool>('automaticallyImplyLeading', automaticallyImplyLeading));
    properties.add(StringProperty('titleText', titleText));
    properties.add(DoubleProperty('elevation', elevation));
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(ColorProperty('backButtonColor', backButtonColor));
    properties.add(EnumProperty<Brightness>('brightness', brightness));
    properties.add(DiagnosticsProperty<IconThemeData>('iconTheme', iconTheme));
    properties.add(DiagnosticsProperty<IconThemeData>('actionsIconTheme', actionsIconTheme));
    properties.add(DiagnosticsProperty<TextTheme>('textTheme', textTheme));
    properties.add(DiagnosticsProperty<bool>('excludeHeaderSemantics', excludeHeaderSemantics));
    properties.add(DoubleProperty('bottomOpacity', bottomOpacity));
    properties.add(DiagnosticsProperty<bool>('centerTitle', centerTitle));
    properties.add(DiagnosticsProperty<bool>('showBackButton', showBackButton));
    properties
        .add(ObjectFlagProperty<VoidCallback>.has('onBackButtonPressed', onBackButtonPressed));
    properties.add(DiagnosticsProperty<TextStyle>('style', style));
    properties.add(DiagnosticsProperty<bool>('hideTitle', hideTitle));
    properties.add(DoubleProperty('leadingWidth', leadingWidth));
    properties.add(DoubleProperty('height', height));
  }
}
