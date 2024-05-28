import 'package:go_router/go_router.dart';
import 'package:iparcompany/core/widgets/onboarding.dart';
import 'package:iparcompany/core/widgets/splash.dart';
import 'package:iparcompany/core/widgets/welcome.dart';
import 'package:iparcompany/features/authentification/presentation/pages/login/login_screen.dart';
import 'package:iparcompany/features/authentification/presentation/pages/sign_up/sign_up_screen.dart';
import 'package:iparcompany/features/home/presentation/pages/home.dart';

final route = GoRouter(
  routes: [
    GoRoute(
      name: '/',
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: "/onboarding",
      path: "/onboarding",
      builder: (context, state) => const OnBoarding(),
    ),
    GoRoute(
      name: "/welcome",
      path: "/welcome",
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      name: "/login",
      path: "/login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: "/signUp",
      path: "/signUp",
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: "/home",
      path: "/home",
      builder: (context, state) => const Home(),
    ),
  ],
);
