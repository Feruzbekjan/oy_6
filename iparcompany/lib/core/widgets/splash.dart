import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:iparcompany/core/extensions/general_extension.dart';
import 'package:iparcompany/core/injector/injector.dart';
import 'package:iparcompany/core/status/status.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentification/presentation/bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authen) {
          context.pushReplacementNamed (context.route.home);
        }
        if (state.status == AuthStatus.unAuth) {
          final shared = sl<SharedPreferences>();

          if (shared.getBool("wizard") == true) {
            context.pushReplacementNamed (context.route.welcome);
          } else {
            context.pushNamed(context.route.onBoarding);
          }
        }
      },
      builder: (context, state) {
        if(state.status == AuthStatus.pure){
          Timer(const Duration(seconds: 3), () {
          context.read<AuthBloc>().add(
                GetUserEvent(),
              );
        });
        }
        
        return Scaffold(
          backgroundColor: context.color.green,
          body: Center(
            child: Image.asset(
              context.images.logo,
              scale: 2,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: context.color.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitFadingCircle(
                  color: context.color.white,
                  size: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
