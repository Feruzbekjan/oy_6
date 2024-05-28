import 'package:flutter/material.dart';
import 'package:iparcompany/assets/colors.dart';
import 'package:iparcompany/assets/fonts.dart';

class AppTheme {
  ThemeData darkTheme() => ThemeData();

  ThemeData lightTheme() {
    final colors = AppColor();
    return ThemeData(
      scaffoldBackgroundColor: colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.white,
      ),
      extensions: [
        AppFonts(
          fontSize20Weight300: TextStyle(
            fontFamily: "Barlow",
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: colors.white,
          ),
          fontSize40Weight700: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: colors.textColor,
          ),
          fontSize16Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: colors.textColor,
          ),
          fontSize16Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colors.textColor,
          ),
          
          fontSize16Weight600: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colors.textColor,
          ),
          fontSize16Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: colors.textColor,
          ),
          fontSize14Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colors.textColor,
          ),
          fontSize24Weight600: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: colors.textColor.withOpacity(0.8),
          ),
          fontSize24Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: colors.textColor,
          ),
          fontSize20Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: colors.textColor,
          ),
          fontSize20Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: colors.textColor,
          ),
          fontSize20Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: colors.textColor,
          ),
          fontSize18Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: colors.textColor,
          ),
          fontSize18Weight600: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: colors.textColor,
          ),
          fontSize18Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: colors.textColor,
          ),
          
          fontSize18Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: colors.textColor,
          ),
          fontSize15Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: colors.textColor,
          ),
          fontSize14Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: colors.textColor,
          ),
          
        
          fontSize14Weight600: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: colors.textColor,
          ),
         
          fontSize14Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: colors.textColor,
          ),
        
          fontSize12Weight500: TextStyle(
            fontFamily: "Barlow",
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: colors.textColor,
          ),
          fontSize12Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: colors.textColor,
          ),
          fontSize10Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: colors.textColor,
          ),
          fontSize8Weight400: TextStyle(
            fontFamily: "Barlow",
            fontSize: 8,
            fontWeight: FontWeight.w400,
            color: colors.textColor,
          ),
          fontSize30Weight700: TextStyle(
            fontFamily: "Barlow",
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: colors.textColor,
          ),
          
        ),
      ],
    );
  }
}
