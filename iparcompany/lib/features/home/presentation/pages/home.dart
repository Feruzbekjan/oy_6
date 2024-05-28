import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iparcompany/core/extensions/general_extension.dart';
import 'package:iparcompany/features/authentification/presentation/bloc/auth_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            """Find your desire \nhealt solution""",
            style: context.style.fontSize24Weight600.copyWith(
              fontSize: 22,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: SvgPicture.asset(context.icons.notification),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.maxFinite, 70),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              style: context.style.fontSize16Weight500,
              cursorColor: context.color.grey,
              // controller: emailController,
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
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            context.read<AuthBloc>().add(
                  LogOutEvent(
                    succsess: () {
                      context.pushNamed(context.route.welcome);
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
          child: const Text("Home"),
        ),
      ),
    );
  }
}
