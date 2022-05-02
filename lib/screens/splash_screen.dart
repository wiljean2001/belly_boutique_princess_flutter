import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../widgets/onboarding_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Image(
        image: AssetImage('graphics/images/LOGO4.png'),
      ),
      splashIconSize: 200,
      duration: 2500,
      splashTransition: SplashTransition.scaleTransition,
      nextScreen: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            Timer(const Duration(seconds: 1), () {
              print("Authenticate");
              print(state.status);
              // Navigator.of(context).pus
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ),
                (route) => false,
              );
            });
          }
          if (state.status == AuthStatus.unauthenticated) {
            Timer(const Duration(seconds: 1), () {
              print("UnAuthenticate");
              print(state.status);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const OnboardingScreen();
                  },
                ),
                (route) => false,
              );
            });
          }
        },
        child: Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.pink,
            ),
          ),
        ),
        // child: const LoginScreen(), // implementar un screen start
      ),
    );
  }
}
