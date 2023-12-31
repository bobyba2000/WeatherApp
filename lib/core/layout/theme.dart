import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    primaryColor: const Color(0xFF025982),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF025982),
      onPrimary: Colors.white,
      secondary: Color(0xFF013B55),
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Color(0xFF025982),
      onBackground: Colors.white,
      surface: Color(0xFF2A576E),
      onSurface: Color(0xFF9AB0BB),
    ),
    appBarTheme: const AppBarTheme(elevation: 0),
    textTheme: GoogleFonts.robotoTextTheme(),
  );
}
