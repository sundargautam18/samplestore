import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appThemeData(BuildContext context) {
  return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme));
}
