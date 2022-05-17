import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../../screens.dart';
import 'app_theme.dart';
import 'drawer/custom_drawer.dart';
import 'drawer/custom_drawer_user.dart';

class MenuDrawerAdminScreen extends StatefulWidget {
  static const String routeName = '/menu-admin';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          // print the status user with the authbloc
          print(BlocProvider.of<AuthBloc>(context).state.status);

          return BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.unauthenticated
              ? const OnboardingScreen()
              : const MenuDrawerAdminScreen();
        });
  }

  const MenuDrawerAdminScreen({Key? key}) : super(key: key); //route
  @override
  State<MenuDrawerAdminScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MenuDrawerAdminScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.65,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              /**
               * devolución de llamada desde el cajón para reemplazar
               * la pantalla según las necesidades del usuario al pasar
               * DrawerIndex (índice Enum)
               */
            },
            screenView: screenView,
            /**
             * reemplazamos la vista de pantalla según sea necesario
             * en las pantallas de inicio de navegación como MyHomePage,
             * HelpScreen, FeedbackScreen, etc.
             */
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const HomeScreen();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            // screenView = HelpScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            // screenView = FeedbackScreen();
          });
          break;
        default:
          break;
      }
    }
  }
}
