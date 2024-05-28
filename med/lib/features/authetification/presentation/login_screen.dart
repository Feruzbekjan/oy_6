import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:med/assets/color.dart';
import 'package:med/assets/icons.dart';
import 'package:med/core/functions/app_functions.dart';
import 'package:med/core/route_names/app_route_names.dart';
import 'package:med/features/authetification/presentation/bloc/auth_bloc.dart';
import 'package:med/features/home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final parolController = TextEditingController();
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          leading: SvgPicture.asset(AppIcons.back),
          leadingWidth: 30,
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              height: 50,
              width: 142,
              child: SvgPicture.asset(
                AppIcons.logo,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Kirish",
                      style: getTextTheme(context).displayMedium!.copyWith(
                            color: AppColor.siyohrang,
                          )),
                ],
              ),
              const Gap(34),
              Text(
                "Email",
                style: getTextTheme(context).bodyLarge!.copyWith(
                      color: AppColor.greyText,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Gap(8),
              TextField(
                style: getTextTheme(context).bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.siyohrang,
                    ),
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: AppColor.textFieldBorder),
                  ),
                  hintText: "Email",
                  hintStyle: getTextTheme(context).bodyLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.greyishText,
                      ),
                ),
              ),
              const Gap(20),
              Text(
                "Maxfiylik kaliti",
                style: getTextTheme(context).bodyLarge!.copyWith(
                      color: AppColor.greyText,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Gap(8),
              TextField(
                obscureText: isObscure,
                keyboardType: TextInputType.visiblePassword,
                style: getTextTheme(context).bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.siyohrang,
                    ),
                controller: parolController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        isObscure ? AppIcons.eye : AppIcons.eyeOn,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: AppColor.textFieldBorder,
                    ),
                  ),
                  hintText: "Maxfiylik kalitini kiriting...",
                  hintStyle: getTextTheme(context).bodyLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.greyishText,
                      ),
                ),
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector( 
                    onTap: () {
                      
                    },
                    child: Text(
                      "Maxfiylik kalitini unutdingizmi ?",
                      style: getTextTheme(context).bodyLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.blue,
                          ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  context.read<AuthBloc>().add(
                        LoginEvent(
                          email: emailController.text,
                          parol: parolController.text,
                          succsess: () {
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          failure: () {
                             ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Xatolik"),
                              ),
                            );
                          },
                        ),
                      );
                },
                child: Container(
                  height: 42,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColor.blue,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Kirish",
                    style: getTextTheme(context).bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouteNames.signUp,
              );
            },
            child: Container(
              height: 42,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.white,
                  border: Border.all(
                    color: AppColor.textFieldBorder,
                  )),
              alignment: Alignment.center,
              child: Text(
                "Ro‘yxatdan o‘tish",
                style: getTextTheme(context).bodyLarge!.copyWith(
                      color: AppColor.siyohrang,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
