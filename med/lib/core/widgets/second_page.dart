import 'package:flutter/material.dart';
import 'package:med/assets/images.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.maxFinite,
        decoration: const BoxDecoration(

          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.onboarding2),
          ),
        ),
      ),
    );
  }
}
