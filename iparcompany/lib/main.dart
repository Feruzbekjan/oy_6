import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iparcompany/core/extensions/general_extension.dart';
import 'package:iparcompany/core/injector/injector.dart';
import 'package:iparcompany/core/route/app_route.dart';
import 'package:iparcompany/features/authentification/presentation/bloc/auth_bloc.dart';
import 'package:iparcompany/firebase_options.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await getInjector();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: route,
          theme: context.theme.lightTheme(),
        ),
      ),
    );
  }
}



// font-weight: 100; (Extra Light)
// font-weight: 200; (Light)
// font-weight: 300; (Book)
// font-weight: 400; (Normal / Regular)
// font-weight: 500; (Medium)
// font-weight: 600; (Semi-Bold / Demi-Bold)
// font-weight: 700; (Bold)
// font-weight: 800; (Extra-Bold / Ultra-Bold)
// font-weight: 900; (Black / Heavy)
