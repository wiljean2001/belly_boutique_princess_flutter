import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../blocs/blocs.dart';
import '../blocs/home/home_page_bloc.dart';
import '../generated/l10n.dart';
import '../repositories/repositories.dart';
import '../views/user_views.dart';
import '../widgets/custom_bottom_navigation.dart';
import 'auth/onboarding_screen.dart';
import 'package:flutter/services.dart';
import 'setting_screen.dart';

class HomeScreen extends StatefulWidget {
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
  @override
  Widget build(BuildContext context) {
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
    final views = [
      const UserProfileView(),
      const HomeView(),
      const ShoppingCartView(),
    ];
    // Items from navigation bar
    const items = <Widget>[
      Icon(Icons.account_circle, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.shopping_cart, size: 30),
    ];

    final itemsAppbar = <String>[
      S.of(context).menu_appbar_item1,
      S.of(context).menu_appbar_item2,
      S.of(context).menu_appbar_item3,
      S.of(context).menu_appbar_item4
    ];
    return Scaffold(
      extendBody: true,
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Row(children: [
          Image(
            image: AssetImage(S.of(context).logo_home),
            width: 55,
          ),
          Text(
            S.of(context).AppTitle,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
          ),
        ]),
        elevation: 10,
        actions: <Widget>[
          IconButton(
            tooltip: S.of(context).tooltip_bttn_shopping_card,
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            tooltip: S.of(context).tooltip_bttn_options,
            onSelected: (index) {
              // Visitanos
              if (index == S.of(context).menu_appbar_item1) {
                Fluttertoast.showToast(
                    msg: "Tab a visitanos",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
              // setting screen
              if (index == S.of(context).menu_appbar_item2) {
                Navigator.pushNamed(context, SettingScreen.routeName);
              }
              // Ayuda
              if (index == S.of(context).menu_appbar_item3) {
                Fluttertoast.showToast(
                    msg: "Tap a ayuda",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
              // SignOut session
              if (index == S.of(context).menu_appbar_item4) {
                RepositoryProvider.of<AuthRepository>(context).signOut();
                context.read<AuthBloc>().add(const AuthUserChanged(user: null));
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              }
            },
            itemBuilder: (BuildContext context) {
              return itemsAppbar.map(
                (String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                },
              ).toList();
            },
          ),
        ],
      ),
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
      bottomNavigationBar: const CustomBottomNavigationBar(items: items),
    );
  }
}
