import 'package:flutter/material.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';

class AppTheme {
  final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.primaryBGColor,
    // colorSchemeSeed: AppColors.primaryBGColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.whiteColor.withOpacity(0.5),
      // selectionColor: darkPrimarySwatchColor,
      // selectionHandleColor: darkPrimarySwatchColor,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontFamily: 'TyrosPro',
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
      ),
    ),

    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.primaryBGColor,
    ),
  );
}
