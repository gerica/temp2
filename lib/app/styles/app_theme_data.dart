import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio_life/app/styles/theme_data_radio_life.dart';

import 'app_color_scheme.dart';
import 'app_font_size.dart';
import 'app_font_weight.dart';
import 'app_spacing.dart';
import 'app_text_theme.dart';

/// https://medium.com/flutter-community/page-transitions-using-themedata-in-flutter-c24afadb0b5d
class AppThemeData extends ThemeDataRadioLife {
  AppThemeData._();

  static bool? _appThemeModeIsDark;

  static void setIfAppThemeModeIsDark({bool? isDark}) {
    _appThemeModeIsDark = isDark;
  }

  static bool get appThemeModeIsDark => _appThemeModeIsDark ?? ThemeDataRadioLife.isDark ?? true;

  static ThemeData get themeData => appThemeModeIsDark ? themeDataDark : themeDataLight;

  static ThemeMode get themeMode => ThemeMode.light;

  static final ThemeData themeDataLight = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: AppColorScheme.primarySwatch,
    accentColor: AppColorScheme.accentColor,
    textTheme: AppTextTheme.textTheme,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      unselectedLabelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      labelPadding: EdgeInsets.symmetric(horizontal: AppSpacing.extraSmall),
    ),
    scaffoldBackgroundColor: RadiolifeThemeColors.background,
    colorScheme: AppColorScheme.colorScheme,
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: RadiolifeThemeColors.background,
      elevation: 0,
      brightness: Brightness.light,
      centerTitle: true,
      titleTextStyle: TextStyle(color: AppColorScheme.textPrimary)
    ),
    highlightColor: Colors.transparent,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColorScheme.success,
      cursorColor: AppColorScheme.success,
      selectionHandleColor: AppColorScheme.success,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    iconTheme: IconThemeData(
      color: AppColorScheme.primarySwatch[500],
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: AppColorScheme.colorScheme, textTheme: ButtonTextTheme.primary),
  );

  static final ThemeData themeDataDark = ThemeData(
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    primarySwatch: AppColorScheme.primarySwatch,
    accentColor: AppColorScheme.accentColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      unselectedLabelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      labelPadding: EdgeInsets.symmetric(horizontal: AppSpacing.extraSmall),
    ),
    textTheme: AppTextTheme.textTheme,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: RadiolifeThemeColors.background,
    colorScheme: AppColorScheme.colorScheme,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColorScheme.success,
      cursorColor: AppColorScheme.success,
      selectionHandleColor: AppColorScheme.success,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: RadiolifeThemeColors.background,
        elevation: 0,
        brightness: Brightness.dark,
        centerTitle: true,
        titleTextStyle: TextStyle(color: AppColorScheme.textPrimary)
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    iconTheme: IconThemeData(
      color: AppColorScheme.primarySwatch[500],
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: RadiolifeThemeColors.backgroundLight,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: RadiolifeThemeColors.darkBlue,
      unselectedItemColor: RadiolifeThemeColors.darkBlue.withOpacity(0.3),
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: AppColorScheme.colorScheme, textTheme: ButtonTextTheme.primary),
  );
}
