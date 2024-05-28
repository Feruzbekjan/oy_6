import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med/core/app_font/app_font.dart';
import 'package:med/core/injector/injector.dart';
import 'package:med/core/routes/app_route.dart';
import 'package:med/features/asosiy/presentation/bloc/maqola_bloc.dart';
import 'package:med/features/authetification/presentation/bloc/auth_bloc.dart';
import 'package:med/features/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:med/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await getItInjector();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => MaqolaBloc(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme().lightTheme(),
        onGenerateRoute: AppRoute.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
