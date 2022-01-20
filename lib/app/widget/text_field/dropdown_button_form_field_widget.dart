import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/widget/text_field/input_decorations.dart';

class DropdownButtonFormFieldWidget extends StatelessWidget {
  final FocusNode? focusNode;
  final TextStyle? style;
  final bool autofocus;
  final Color? background;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? prefixText;
  final Widget? prefixIcon;
  final TextStyle? prefixStyle;
  final Color? borderColor;
  final double? height;
  final String? errorText;
  final List<DropdownMenuItem> itens;
  final Function(dynamic) onChanged;
  final dynamic selected;
  final bool isExpanded;

  const DropdownButtonFormFieldWidget({
    required this.itens,
    required this.onChanged,
    required this.selected,
    this.focusNode,
    this.style,
    this.autofocus = false,
    this.background,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.prefixText,
    this.prefixIcon,
    this.prefixStyle,
    this.borderColor,
    this.height,
    this.errorText,
    this.isExpanded = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildTextFieldCore(context),
    );
  }

  DropdownButtonFormField buildTextFieldCore(BuildContext context) {
    final decoration = InputDecorations(
      height: height,
      background: background,
      borderColor: borderColor,
      errorText: errorText,
      hintStyle: hintStyle,
      hintText: hintText,
      prefixIcon: prefixIcon,
      prefixText: prefixText,
      prefixStyle: prefixStyle,
      suffixIcon: suffixIcon,
    );
    return DropdownButtonFormField(
      focusNode: focusNode,
      value: selected,
      style: style ?? TextStyle(fontSize: AppFontSize.primary, color: AppColorScheme.textPrimary),
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: decoration.buildInputDecoration(),
      items: itens,
      isExpanded: isExpanded,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('hintText', hintText))
      ..add(DiagnosticsProperty<FocusNode>('focusNode', focusNode));
    properties.add(DiagnosticsProperty<TextStyle>('style', style));
    properties.add(DiagnosticsProperty<TextStyle?>('hintStyle', hintStyle));
    properties.add(DiagnosticsProperty<TextStyle?>('prefixStyle', prefixStyle));
    properties.add(StringProperty('prefixText', prefixText));
    properties.add(DiagnosticsProperty<bool>('autofocus', autofocus));
    properties.add(ColorProperty('background', background));
    properties.add(ColorProperty('borderColor', borderColor));
    properties.add(DoubleProperty('height', height));
    properties.add(StringProperty('errorText', errorText));
    properties.add(DiagnosticsProperty<Function(String p1)>('onChanged', onChanged));
    properties.add(DiagnosticsProperty<dynamic>('selected', selected));
    properties.add(DiagnosticsProperty<bool>('isExpanded', isExpanded));
  }
}
