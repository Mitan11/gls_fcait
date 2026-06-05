import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography helpers built on Google Fonts.
abstract final class AppTextStyles {
  static TextStyle manrope({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.manrope(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle playfair({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    double? letterSpacing,
  }) {
    return GoogleFonts.playfairDisplay(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle get appBarTitle =>
      playfair(fontWeight: FontWeight.w600);

  static TextStyle get sectionLabel => manrope(
        letterSpacing: 1.4,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
      );

  static TextStyle get sectionHeading => manrope(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
}
