import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../generated/l10n.dart';
import 'auth/onboarding_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SplashScreen(),
    );
  }

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              print("Listener");
              print("State on Splash:-> $state.status");
              if (state.status == AuthStatus.authenticated) {
                Timer(
                  const Duration(seconds: 1),
                  () => Navigator.of(context).pushNamedAndRemoveUntil(
                    HomeScreen.routeName,
                    (route) => false,
                  ),
                );
              }
              if (state.status == AuthStatus.unauthenticated) {
                Timer(
                  const Duration(seconds: 1),
                  () => Navigator.of(context).pushNamedAndRemoveUntil(
                    OnboardingScreen.routeName,
                    (route) => false,
                  ),
                );
              }
            },
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(S.of(context).logo),
                      width: 270,
                    ),
                    // SvgPicture.asset(
                    //   'assets/logo.svg',
                    //   height: 100,
                    // ),
                    // SizedBox(height: 20),
                    // Text(
                    //   'ARROW',
                    //   style: Theme.of(context).textTheme.headline1,
                    // )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

// return AnimatedSplashScreen(
//   splash: const Image(
//     image: AssetImage('graphics/images/LOGO4.png'),
//   ),
//   splashIconSize: 200,
//   duration: 2500,
//   splashTransition: SplashTransition.scaleTransition,
//   nextScreen: BlocListener<AuthBloc, AuthState>(
//     listener: (context, state) {
//       print("State on Splash:->>>");
//       print(state.status);
//       if (state.status == AuthStatus.authenticated) {
//         Timer(const Duration(seconds: 1), () {
//           print("Authenticate");
//           print(state.status);
//           // Navigator.of(context).pus
//           Navigator.of(context).pushNamed(HomeScreen.routeName);
//         });
//       }
//       if (state.status == AuthStatus.unauthenticated) {
//         Timer(const Duration(seconds: 1), () {
//           print("UnAuthenticate");
//           print(state.status);
//           Navigator.of(context).pushNamedAndRemoveUntil(
//             OnboardingScreen.routeName,
//             ModalRoute.withName('/onboarding'),
//           );
//         });
//       }
//     },
//     child: Container(
//       color: Colors.white,
//       child: const Center(
//         child: CircularProgressIndicator(
//           color: Colors.pink,
//         ),
//       ),
//     ),
//     // child: const LoginScreen(), // implementar un screen start
//   ),
// );
