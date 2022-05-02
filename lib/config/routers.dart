import 'package:flutter/material.dart';

// import '/models/models.dart';
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
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      // case UsersScreen.routeName:
      //   return UsersScreen.route(user: settings.arguments as User);
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      // case MatchesScreen.routeName:
      //   return MatchesScreen.route();
      // case ProfileScreen.routeName:
      //   return ProfileScreen.route();
      // case ChatScreen.routeName:
      //   return ChatScreen.route(userMatch: settings.arguments as UserMatch);
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
