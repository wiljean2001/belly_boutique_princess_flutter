import 'package:flutter/material.dart';

import 'package:belly_boutique_princess/screens/onboarding_auth/onboarding_screen.dart';

import '../../blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';

import '../../pages/user_views.dart';
import '../../widgets/custom_bottom_navigation.dart';
import '../admin/navigator_admin_screens.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home'; //route

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) {
        // print the status user with the authbloc
        print(BlocProvider.of<AuthBloc>(context).state.status);

        return BlocProvider.of<AuthBloc>(context).state.status ==
                AuthStatus.unauthenticated
            ? const OnboardingScreen()
            : const HomeScreen();
      },
    );
  }

  const HomeScreen({
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
    List<Widget> views = [
      const UserProfileView(),
      const HomeView(),
      const ShoppingCartView(),
    ];

    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is HomePageInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is BottomNavigationInitial) {
          return Scaffold(
            body: views[state.indexBottomNav],
            bottomNavigationBar: const CustomBottomNavigationBar(),
          );
        }
        return Text(S.of(context).Error_displaying_interaces);
      },
    );
    return Scaffold();
  }
}
