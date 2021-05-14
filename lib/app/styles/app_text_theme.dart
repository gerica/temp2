import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  /// https://material.io/design/typography/the-type-system.html#type-scale - Helps to create textTheme

  static TextTheme get textTheme => textThemeMontserrat;

  static TextTheme textThemeMontserrat = TextTheme(
    headline1: GoogleFonts.openSans(
      fontSize: 96,
      fontWeight: FontWeight.w300,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 60,
      fontWeight: FontWeight.w300,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 34,
      fontWeight: FontWeight.w400,
    ),
    headline5: GoogleFonts.openSans(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    subtitle1: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    subtitle2: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodyText1: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
    bodyText2: GoogleFonts.openSans(
      fontSize: 16,
    ),
    button: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    caption: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    overline: GoogleFonts.openSans(
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  );
}
