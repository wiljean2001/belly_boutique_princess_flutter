import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import 'auth/onboarding_screen.dart';
import '/views/home_view.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/'; //route

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          // print the status user with the authbloc
          print("State.status->?");
          print(BlocProvider.of<AuthBloc>(context).state.status);

          return BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.unauthenticated
              ? const OnboardingScreen()
              : const HomeScreen();
        });
  }

  // final User user;
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  // Seteo del bottom navigation opcions del sistema operativo
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.pink,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.pink,
  );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    return const HomeView();
  }
}
