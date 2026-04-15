import 'package:flutter/material.dart';

/// The app's light and dark themes. The theme is used as a widget tree ancestor
/// for material widgets. The theme determines the colors and font styles for
/// a material app.
class AppTheme {
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        toolbarHeight: 90,
        surfaceTintColor: Colors.transparent,
      ),
      textTheme: TextTheme(
        bodyLarge: _boldTextStyle(),
        bodyMedium: _normalTextStyle(),
      ),
    );
  }

  static ThemeData light() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        toolbarHeight: 90,
        surfaceTintColor: Colors.transparent,
      ),
      textTheme: TextTheme(
        bodyLarge: _boldTextStyle(color: Colors.black),
        bodyMedium: _normalTextStyle(color: Colors.black),
      ),
    );
  }

  static TextStyle _boldTextStyle(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w700,
    );
  }

  static TextStyle _normalTextStyle(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}
