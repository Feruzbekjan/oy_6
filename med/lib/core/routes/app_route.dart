import 'package:flutter/material.dart';
import 'package:med/core/functions/app_functions.dart';
import 'package:med/core/route_names/app_route_names.dart';
import 'package:med/core/widgets/onboarding.dart';
import 'package:med/core/widgets/splash_screen.dart';
import 'package:med/features/authetification/presentation/login_screen.dart';
import 'package:med/features/authetification/presentation/pages/signup.dart';
import 'package:med/features/home/home.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(
          const SplashScreen(),
        );

      case AppRouteNames.login:
        return fade(
          const LoginScreen(),
        );
      case AppRouteNames.onboarding:
        return fade(
          const OnBoarding(),
        );
      case AppRouteNames.signUp:
        return fade(
          const SignUpPage(),
        );
      case AppRouteNames.home:
        return fade(
          const HomeScreen(),
        );
      // case AppRouteNames.createNewPassword:
      //   return fade(const CreateNewPassword());
      // case AppRouteNames.calendar:
      //   return fade(const CalendarScreen());
      // case AppRouteNames.statistics:
      //   return fade(const StatisticsScreen());
      default:
        return fade(const Scaffold());
    }
  }
}
