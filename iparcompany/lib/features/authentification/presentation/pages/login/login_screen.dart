import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iparcompany/core/extensions/general_extension.dart';
import 'package:iparcompany/core/widgets/appbar/appbar_widget.dart';
import 'package:iparcompany/features/authentification/presentation/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 60),
          child: WAppBarWidget(
            ontap: () {
              context.pop();
            },
            context: context,
            title: Text(
              "Login",
              style: context.style.fontSize18Weight700,
            ),
          ),
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Gap(24),
                  TextField(
                    style: context.style.fontSize16Weight500,
                    cursorColor: context.color.grey,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: context.style.fontSize16Weight400.copyWith(
                        color: context.color.grey,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          context.icons.sms,
                        ),
                      ),
                      filled: true,
                      fillColor: context.color.textFieldBackground,
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: context.color.textfieldBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: context.color.textfieldBorder,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: context.color.textfieldBorder,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const Gap(16),
                  TextField(
                    obscureText: state.isObscure,
                    style: context.style.fontSize16Weight500,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: context.style.fontSize16Weight400.copyWith(
                        color: context.color.grey,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(context.icons.parol),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          context.read<AuthBloc>().add(IsObscureTextEvent());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: state.isObscure
                              ? Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: context.color.grey,
                                )
                              : SvgPicture.asset(context.icons.eye),
                        ),
                      ),
                      filled: true,
                      fillColor: context.color.textFieldBackground,
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: context.color.textfieldBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: context.color.textfieldBorder,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: context.color.textfieldBorder,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const Gap(30),
                  GestureDetector(
                    onTap: () {
                      context.read<AuthBloc>().add(
                            LoginEvent(
                              email: emailController.text,
                              parol: passwordController.text,
                              succsess: () {
                                context.pushNamed(context.route.home);
                              },
                              failure: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Xatolik Bo'ldi"),
                                  ),
                                );
                              },
                            ),
                          );
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
                  const Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: context.style.fontSize15Weight400.copyWith(
                          color: context.color.greyish,
                        ),
                      ),
                      const Gap(3),
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Text(
                          "Sign Up",
                          style: context.style.fontSize15Weight400.copyWith(
                            color: context.color.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 2,
                        width: (MediaQuery.of(context).size.width / 100) * 36.6,
                        decoration: BoxDecoration(
                          color: context.color.textfieldBorder,
                        ),
                      ),
                      Text(
                        "OR",
                        style: context.style.fontSize16Weight400.copyWith(
                          color: context.color.grey,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: (MediaQuery.of(context).size.width / 100) * 36.6,
                        decoration: BoxDecoration(
                          color: context.color.textfieldBorder,
                        ),
                      ),
                    ],
                  ),
                  const Gap(25),
                  GestureDetector(
                    onTap: () {
                      context.read<AuthBloc>().add(
                            GoogleSignInEvent(
                              succsess: () {
                                context.pushNamed(context.route.home);
                              },
                              failure: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Xatolik Bo'ldi"),
                                  ),
                                );
                              },
                            ),
                          );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: double.maxFinite,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: context.color.textfieldBorder,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(context.icons.google),
                          Text(
                            "Sign in with Google",
                            style: context.style.fontSize16Weight600,
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
