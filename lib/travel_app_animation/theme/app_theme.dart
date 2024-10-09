import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme get textTheme {
    return TextTheme(
      headlineLarge:
          GoogleFonts.montserrat(fontSize: 40, fontWeight: FontWeight.bold),
      headlineMedium:
          GoogleFonts.montserrat(fontSize: 35, fontWeight: FontWeight.w500),
      headlineSmall:
          GoogleFonts.montserrat(fontSize: 30, fontWeight: FontWeight.bold),
      bodyMedium:
          GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600),
      bodySmall:
          GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400),
      titleMedium:
          GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall:
          GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400),
    );
  }
}
