// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle onboarding;
  ThemeTextStyles({
    required this.onboarding,
  });

  static ThemeTextStyles light = ThemeTextStyles(
    onboarding: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  );

  @override
  ThemeExtension<ThemeTextStyles> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(
      covariant ThemeExtension<ThemeTextStyles>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
