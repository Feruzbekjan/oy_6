import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iparcompany/core/extensions/general_extension.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  context.images.logo,
                ),
              ),
              const Gap(40),
              Text(
                "Let’s get started!",
                style: context.style.fontSize20Weight700,
              ),
              const Gap(9),
              Text(
                "Login to enjoy the features we’ve \n     provided, and stay healthy!",
                style: context.style.fontSize16Weight400.copyWith(
                  color: context.color.greyish,
                ),
              ),
              const Gap(60),
              GestureDetector( 
                onTap: () {
                  context.pushNamed(context.route.login);
                },
                child: Container(
                  width: double.maxFinite,
                  height: 56,
                  decoration: BoxDecoration(
                    color: context.color.green,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: context.style.fontSize16Weight600.copyWith(
                      color: context.color.white,
                    ),
                  ),
                ),
              ),
              const Gap(16),
              GestureDetector( 
                onTap: () {
                  context.pushNamed(context.route.singUp);
                },
                child: Container(
                  width: double.maxFinite,
                  height: 56,
                  decoration: BoxDecoration(
                    color: context.color.white,
                    border: Border.all(
                      color: context.color.green,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Sign Up",
                    style: context.style.fontSize16Weight600.copyWith(
                      color: context.color.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
