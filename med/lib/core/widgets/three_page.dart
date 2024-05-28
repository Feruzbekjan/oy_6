import 'package:flutter/material.dart';
import 'package:med/assets/images.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({super.key});

  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.maxFinite,
        decoration: const BoxDecoration(

          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.onboarding3),
          ),
        ),
      ),
    );
  }
}
