import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:med/assets/icons.dart';
import 'package:med/core/auth_status/status.dart';
import 'package:med/core/injector/injector.dart';
import 'package:med/core/route_names/app_route_names.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/authetification/presentation/bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state)  {
        if (state.status == Status.unAuthen) {
          final shared = sl<SharedPreferences>();
          if (shared.getBool("wizard") == true) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouteNames.login,
              (route) => false,
            );
          } else if(shared.getBool("wizard") == null) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouteNames.onboarding,
              (route) => false,
            );
          }
        } else if (state.status == Status.authen) {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRouteNames.home, (route) => false);
        }
      },
      builder: (context, state) {
        if (state.status == Status.pure) {
          Timer(const Duration(seconds: 3), () {
            context.read<AuthBloc>().add(
                  GetUserEvent(),
                );
          });
        }
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Gap(MediaQuery.of(context).size.height / 2),
                  SvgPicture.asset(
                    AppIcons.logo,
                  ),
                  const Spacer(),
                  const CupertinoActivityIndicator(
                    radius: 16,
                  ),
                  const Gap(32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
