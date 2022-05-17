import 'package:flutter/material.dart';

import '../../blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';

import '../../navegator_screens.dart';
import '../../pages/user_views.dart';
import '../../widgets/custom_bottom_navigation.dart';
import '../auth/onboarding_screen.dart';
import '../../blocs/home/home_page_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homemenu'; //route

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          // print the status user with the authbloc
          print(BlocProvider.of<AuthBloc>(context).state.status);

          return BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.unauthenticated
              ? const OnboardingScreen()
              : NavegatorScreen();
        });
  }

  // final User user;
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

  // print('USER STATE_> ${context.read<>().state}');
  // try {
  //   return BlocBuilder<ProfileBloc, ProfileState>(
  //     builder: (context, state) {
  //       print('State: $state');
  //       if (state is ProfileLoading) {
  //         return const CircularProgressIndicator();
  //       }
  //       if (state is ProfileLoaded) {
  //         if (state.user.role == 'user') {
  //           print('USER WITH ROLE');
  //           return HomeUser(views: views);
  //         } else {
  //           print('USER WITHOUT ROLE');
  //           return HomeUser(views: views);
  //         }
  //       }
  //       // print('${context.read<ProfileBloc>().state}');
  //       return const CircularProgressIndicator();
  //     },
  //   );
  // } catch (e) {
  //   print('Error_> $e');
  // }
  // return Text('Error');

  @override
  Widget build(BuildContext context) {
    final views = [
      const UserProfileView(),
      const HomeView(),
      const ShoppingCartView(),
      // const MenuAdmintration()
    ];
    return Scaffold(
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BottomNavigationInitial) {
            return views[state.indexBottomNav];
          }
          return Text(S.of(context).Error_displaying_interaces);
        },
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
