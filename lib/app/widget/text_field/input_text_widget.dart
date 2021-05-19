import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_corner_radius.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_font_weight.dart';
import 'package:radio_life/app/styles/app_spacing.dart';

abstract class FieldWidget {
  TextFormField buildTextFieldCore();
}

class InputTextWidget extends StatelessWidget implements FieldWidget {

  final String? errorText;
  final String? hintText;
  final String? prefixText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool keyboardSuggestions;
  final bool readOnly;
  final int? maxLength;
  final int? maxLines;
  final int? heightMultiplier;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function() onFieldSubmitted;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final EdgeInsets? margin;
  final double? height;
  final TextCapitalization? textCapitalization;
  final EdgeInsets? padding;
  final FocusNode? focusNode;
  final List<TextInputFormatter> formatters;
  final TextEditingController controller;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? prefixStyle;
  final bool showDecoration;
  final bool autofocus;
  final Color? background;

  const InputTextWidget({
    required this.onFieldSubmitted,
    required this.controller,
    this.errorText = '',
    this.onChanged,
    this.onEditingComplete,
    this.focusNode,
    this.prefixIcon,
    this.prefixStyle,
    this.hintText,
    this.margin,
    this.suffixIcon,
    this.prefixText,
    this.textCapitalization,
    this.keyboardType,
    this.background,
    this.hintStyle,
    this.height,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.keyboardSuggestions = false,
    this.readOnly = false,
    this.formatters = const [],
    this.heightMultiplier = 1,
    this.textAlign,
    this.padding,
    this.style,
    this.autofocus = false,
    Key? key,
    this.showDecoration = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => //
      Container(
        child: buildTextFieldCore(),
      );

  TextFormField buildTextFieldCore() => TextFormField(
        controller: controller,
        focusNode: focusNode,
        textAlignVertical: TextAlignVertical.center,
        obscureText: obscureText,
        inputFormatters: formatters,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        enableSuggestions: keyboardSuggestions,
        autocorrect: keyboardSuggestions,
        maxLength: maxLength,
        maxLines: maxLines,
        readOnly: readOnly,
        style: style ??
            TextStyle(
                fontSize: AppFontSize.primary,
                color: AppColorScheme.textPrimary,
                fontWeight: AppFontWeight.semiBold),
        onEditingComplete: () {
          focusNode?.unfocus();
          onEditingComplete!();
        },
        onFieldSubmitted: (_) {
          focusNode?.unfocus();
          onFieldSubmitted();
        },
        autofocus: autofocus,
        onChanged: onChanged,
        cursorColor: AppColorScheme.textPrimary,
        decoration: showDecoration ? _buildInputDecoration() : _buildClearInputDecoration(),
      );

  InputDecoration _buildInputDecoration() => InputDecoration(
        fillColor: background ?? AppColorScheme.backgroundLight,
        filled: true,
        suffixIcon: suffixIcon ?? Container(height: 0, width: 0),
        hintText: hintText,
        disabledBorder: _buildInputBorderSide,
        enabledBorder: _buildInputBorderSide,
        prefixText: prefixText,
        suffixIconConstraints: BoxConstraints(minHeight: height ?? 50),
        prefixStyle: prefixStyle,
        errorBorder: _buildInputBorderSide,
        focusedBorder: _buildInputBorderSide,
        focusedErrorBorder: _buildInputBorderSide,
        border: _buildInputBorderSide,
        hintStyle: hintStyle ??
            TextStyle(fontSize: AppFontSize.primary, color: AppColorScheme.textSecondary),
        errorStyle: TextStyle(fontSize: AppFontSize.secondary, color: AppColorScheme.error),
        errorText: errorText,
        contentPadding: const EdgeInsets.only(left: AppSpacing.extraMedium),
      );

  InputDecoration _buildClearInputDecoration() => InputDecoration(
        filled: false,
        suffixIcon: suffixIcon ?? Container(height: 0, width: 0),
        hintText: hintText,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        prefixText: prefixText,
        suffixIconConstraints: BoxConstraints(minHeight: height ?? 62),
        prefixStyle: prefixStyle,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        border: InputBorder.none,
        hintStyle: hintStyle ??
            TextStyle(fontSize: AppFontSize.primary, color: AppColorScheme.textPrimary),
        errorStyle: TextStyle(fontSize: AppFontSize.secondary, color: AppColorScheme.error),
        errorText: errorText,
        contentPadding: EdgeInsets.zero,
      );

  InputBorder get _buildInputBorderSide => const OutlineInputBorder(
      borderRadius: BorderRadius.all(AppCornerRadius.medium));

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('obscureText', obscureText))
      ..add(StringProperty('hintText', hintText))
      ..add(DiagnosticsProperty<TextInputType>('keyboardType', keyboardType))
      ..add(DiagnosticsProperty<TextEditingController>('controller', controller))
      ..add(IterableProperty<TextInputFormatter>('formatters', formatters))
      ..add(DiagnosticsProperty<bool>('keyboardSuggestions', keyboardSuggestions))
      ..add(DiagnosticsProperty<FocusNode>('focusNode', focusNode))
      ..add(IntProperty('maxLength', maxLength))
      ..add(IntProperty('maxLines', maxLines))
      ..add(IntProperty('heightMultiplier', heightMultiplier))
      ..add(DiagnosticsProperty<Function()>('onEditingComplete', onEditingComplete))
      ..add(DiagnosticsProperty<Function()>('onFieldSubmitted', onFieldSubmitted))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(EnumProperty<TextAlign>('textAlign', textAlign))
      ..add(StringProperty('errorText', errorText));
    properties.add(DiagnosticsProperty<TextStyle>('style', style));
    properties.add(DiagnosticsProperty<Function(String p1)>('onChanged', onChanged));
    properties.add(DoubleProperty('height', height));
    properties.add(DiagnosticsProperty<EdgeInsets?>('margin', margin));
    properties.add(DiagnosticsProperty<TextStyle?>('hintStyle', hintStyle));
    properties.add(DiagnosticsProperty<TextStyle?>('prefixStyle', prefixStyle));
    properties.add(StringProperty('prefixText', prefixText));
    properties.add(EnumProperty<TextCapitalization?>('textCapitalization', textCapitalization));
    properties.add(DiagnosticsProperty<bool>('showDecoration', showDecoration));
    properties.add(DiagnosticsProperty<bool>('autofocus', autofocus));
    properties.add(ColorProperty('background', background));
    properties.add(DiagnosticsProperty<bool>('readOnly', readOnly));
  }
}
