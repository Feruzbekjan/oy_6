import 'package:flutter/material.dart';
import 'package:task/core/widgets/onboarding/onboarding_page.dart';

void main()async { 
  WidgetsFlutterBinding.ensureInitialized(); 


  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, 

      home: OnBoarding(),
    );
  }
}
