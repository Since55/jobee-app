import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColorSchema {
  final Color primaryColor;
  final Color primaryTextColor;
  final Color primaryBgColor;
  final Color secondaryBgColor;

  const AppColorSchema({
    required this.primaryColor,
    required this.primaryBgColor,
    required this.secondaryBgColor,
    required this.primaryTextColor,
  });
}

class AppTheme {
  static AppColorSchema colors = const AppColorSchema(
    primaryColor: Color(0xFFFCB43A),
    primaryTextColor: Color(0xFF23212C),
    secondaryBgColor: Color(0xFF23212C),
    primaryBgColor: Colors.white,
  );

  static TextStyle applyFontWeight(TextStyle style) =>
      style.merge(GoogleFonts.inter(fontWeight: style.fontWeight));

  static ThemeData buildTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.primaryBgColor,
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: AppTheme.colors.primaryColor,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        color: colors.primaryColor,
        titleTextStyle: GoogleFonts.exo2(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          enableFeedback: true,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: colors.secondaryBgColor,
          selectedIconTheme: IconThemeData(
            size: 32,
            color: colors.primaryColor,
          ),
          unselectedIconTheme: IconThemeData(
            size: 32,
            color: colors.primaryBgColor,
          )),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: colors.primaryColor.withOpacity(.4),
        cursorColor: colors.primaryTextColor,
        // Android only
        selectionHandleColor: colors.primaryColor,
      ),
      textTheme: Theme.of(context)
          .textTheme
          .merge(GoogleFonts.interTextTheme())
          .apply(bodyColor: colors.primaryTextColor, fontSizeFactor: 1),
    );
  }
}
