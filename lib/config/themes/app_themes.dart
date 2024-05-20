import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/core.dart';

enum AppTheme {
  // ignore: constant_identifier_names
  LIGHT,
  // ignore: constant_identifier_names
  DARK,
}

final appThemeData = {
  AppTheme.DARK: ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    textTheme: textThemeDark(),
  )
};

TextTheme textThemeDark() {
  return TextTheme(
    displayLarge: GoogleFonts.lato(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: GoogleFonts.lato(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: GoogleFonts.lato(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: GoogleFonts.lato(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: GoogleFonts.lato(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: GoogleFonts.lato(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: GoogleFonts.lato(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.lato(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  );
}
