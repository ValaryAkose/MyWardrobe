import 'package:flutter/material.dart';

class MyWardrobeColors {
  static const background = Color(0xFFFCFBFA);
  static const text = Color(0xFF17151A);
  static const secondaryText = Color(0xFF77727A);

  static const lavender = Color(0xFFE9E0F4);
  static const violet = Color(0xFF7654A8);
  static const blush = Color(0xFFF4DCE5);

  static const border = Color(0xFFE9E5E8);
  static const white = Color(0xFFFFFFFF);
}

class MyWardrobeTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: MyWardrobeColors.background,

      colorScheme: ColorScheme.fromSeed(
        seedColor: MyWardrobeColors.violet,
        brightness: Brightness.light,
      ),

      fontFamily: 'Inter',

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'DM Serif Display',
          fontSize: 42,
          fontWeight: FontWeight.w400,
          color: MyWardrobeColors.text,
        ),
        displayMedium: TextStyle(
          fontFamily: 'DM Serif Display',
          fontSize: 34,
          fontWeight: FontWeight.w400,
          color: MyWardrobeColors.text,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'DM Serif Display',
          fontSize: 30,
          fontWeight: FontWeight.w400,
          color: MyWardrobeColors.text,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: MyWardrobeColors.text,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: MyWardrobeColors.text,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: MyWardrobeColors.secondaryText,
        ),
      ),
    );
  }
}
