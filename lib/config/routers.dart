import 'package:belly_boutique_princess/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import '../pages/pruebaAnimate.dart';
import '../screens/admin/admin_screens.dart';
import '../navegator_screens.dart';
import '/screens/screens.dart';

class Routers {
  // generate a setting route
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}'); // print the route name

    print(settings); // print the routes
    switch (settings.name) {
      // switch the name route on screens
      case '/':
        return HomeScreen.route();
      case NavegatorScreen.routeName:
        return NavegatorScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case SettingScreen.routeName:
        return SettingScreen.route();
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      case MenuAdmintration.routeName:
        return MenuAdmintration.route();
      case CreateProductScreen.routeName:
        return CreateProductScreen.route();
      case OpenContainerTransformDemo.routeName:
        return OpenContainerTransformDemo.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: const Text('error'))),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
