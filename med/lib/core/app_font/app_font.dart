import 'package:flutter/material.dart';
import 'package:med/assets/color.dart';

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
      textTheme:  const TextTheme(
        displaySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "Barlow",
          color: AppColor.white,
        ),
        displayLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: "Barlow",
          color: AppColor.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          fontFamily: "Barlow",
          color: AppColor.white,
        ),
        bodySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: "Barlow",
          color: AppColor.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: "Barlow",
          color: AppColor.white,
        ),
        displayMedium:TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: "Barlow",
          color: AppColor.white,
        ),  
      ),
    );
  }
}
