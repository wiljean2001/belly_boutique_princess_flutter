import 'dart:async';

import 'package:belly_boutique_princess/screens/onboarding_auth/onboarding_screen.dart';
import 'package:belly_boutique_princess/screens/screens.dart';
import 'package:flutter/material.dart';

import '../../blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pages/user_views.dart';
import 'admin/admin_screens.dart';

class MenuUserScreen extends StatelessWidget {
  static const String routeName = '/'; //route

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) {
        // print the status user with the authbloc
        print(BlocProvider.of<AuthBloc>(context).state.status);

        return BlocProvider.of<AuthBloc>(context).state.status ==
                AuthStatus.unauthenticated
            ? const OnboardingScreen()
            : const MenuUserScreen();
      },
    );
  }

  const MenuUserScreen({
    Key? key,
  }) : super(key: key);

  // Seteo del bottom navigation opcions del sistema operativo
  // if (BlocProvider.of<AuthBloc>(context).state.status ==
  //     AuthStatus.authenticated) {
  //   const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.pink,
  //     // systemNavigationBarColor: Colors.transparent,
  //     systemNavigationBarIconBrightness: Brightness.light,
  //     systemNavigationBarDividerColor: Colors.pink,
  //   );
  //   SystemChrome.setSystemUIOverlayStyle(overlayStyle);
  // }
  // pages

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          return BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                if (state.user.role == 'admin') {
                  Timer(
                    const Duration(seconds: 2),
                    () => Navigator.of(context).pushNamedAndRemoveUntil(
                      MenuAdminScreen.routeName,
                      (route) => false,
                    ),
                  );
                } else {
                  Timer(
                    const Duration(seconds: 2),
                    () => Navigator.of(context).pushNamedAndRemoveUntil(
                      HomeScreen.routeName,
                      (route) => true,
                    ),
                  );
                }
                print('-');
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              print('-/-');
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
