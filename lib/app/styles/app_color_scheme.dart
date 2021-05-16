import 'package:flutter/material.dart';
import 'package:radio_life/app/utils/style_utils.dart';

class AppColorScheme {

  static final ColorScheme colorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    backgroundColor: RadiolifeThemeColors.background,
    accentColor: RadiolifeThemeColors.accentColor,
    primarySwatch: RadiolifeThemeColors.primarySwatch,
    cardColor: RadiolifeThemeColors.backgroundLight,
    errorColor: error,
  );

  static const white = Colors.white;

  static MaterialColor get primarySwatch => RadiolifeThemeColors.primarySwatch;

  static MaterialColor get accentColor => RadiolifeThemeColors.accentColor;

  static Color get background => RadiolifeThemeColors.background;

  static Color get whiteOutline => RadiolifeThemeColors.whiteOutline;

  static Color get blue => RadiolifeThemeColors.blue;

  static Color get pink => RadiolifeThemeColors.pink;

  static Color get footer => RadiolifeThemeColors.footer;

  static Color get success => RadiolifeThemeColors.success;

  static Color get error => RadiolifeThemeColors.error;

  static Color get textPrimary => RadiolifeThemeColors.textPrimary;

  static Color get textSecondary => RadiolifeThemeColors.textSecondary;

  static Color get backgroundLight => RadiolifeThemeColors.backgroundLight;

  static Color get backgroundPink => RadiolifeThemeColors.backgroundPink;

  static Color get backgroundLightPink => RadiolifeThemeColors.backgroundLightPink;

  static Color get backgroundExtraLightPink => RadiolifeThemeColors.backgroundExtraLightPink;

  static const lightGray = Color(0xffe4e4e4);
}

class RadiolifeThemeColors {
  static final MaterialColor primarySwatch = StyleUtils.createMaterialColor(pink);
  static final MaterialColor accentColor = StyleUtils.createMaterialColor(blue);

  static const whiteOutline = Color(0xFFFFFFFF);
  static const background = Color(0xFFCBDFE6);
  static const blue = Color(0xFF0078A8);
  static const pink = Color(0xFFFA4B86);
  static const footer = Color(0xFFFA4B86);
  static const textPrimary = Color(0xFF364E57);
  static const textSecondary = Color(0xFF7698A4);
  static const backgroundLight = Color(0xFFF1F4F7);
  static const backgroundPink = Color(0xFFFC95B9);
  static const backgroundLightPink = Color(0xFFFEE6EE);
  static const backgroundExtraLightPink = Color(0xFFFFF7F8);
  static const success = Color(0xFF74DBB5);
  static const error = Color(0xFFCF3E5A);
}