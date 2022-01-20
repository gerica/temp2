import 'package:flutter/material.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_corner_radius.dart';
import 'package:radio_life/app/styles/app_font_size.dart';
import 'package:radio_life/app/styles/app_spacing.dart';

class InputDecorations {
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

  const InputDecorations({
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
  });

  InputDecoration buildInputDecoration() => InputDecoration(
        fillColor: background ?? AppColorScheme.white,
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: suffixIcon ?? Container(height: 0, width: 0),
        ),
        labelText: hintText,
        labelStyle: TextStyle(color: AppColorScheme.gray1),
        disabledBorder: buildBorderSide,
        enabledBorder: buildBorderSide,
        prefix: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: prefixIcon,
        ),
        prefixText: prefixText,
        suffixIconConstraints: BoxConstraints(minHeight: height ?? 50),
        prefixStyle: prefixStyle,
        errorBorder: buildInputErrorBorderSide,
        focusedBorder: buildFocusedBorderSide,
        focusedErrorBorder: buildInputErrorBorderSide,
        border: buildBorderSide,
        hintStyle: hintStyle ?? TextStyle(fontSize: AppFontSize.primary, color: AppColorScheme.textSecondary),
        errorStyle: TextStyle(fontSize: AppFontSize.secondary, color: AppColorScheme.error),
        errorText: errorText,
        contentPadding: const EdgeInsets.only(left: AppSpacing.extraMedium, top: AppSpacing.small),
      );

  InputBorder get buildFocusedBorderSide => OutlineInputBorder(
        borderRadius: const BorderRadius.all(AppCornerRadius.mini),
        borderSide: BorderSide(width: 2, color: borderColor ?? AppColorScheme.darkBlue),
      );

  InputBorder get buildInputErrorBorderSide => OutlineInputBorder(
        borderRadius: const BorderRadius.all(AppCornerRadius.mini),
        borderSide: BorderSide(
          width: 1,
          color: AppColorScheme.error,
        ),
      );

  InputBorder get buildBorderSide => const OutlineInputBorder(
        borderRadius: BorderRadius.all(AppCornerRadius.mini),
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFFD8D8D8),
        ),
      );
}
