import 'package:flutter/material.dart';

import '../../blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';

import '../../pages/user_views.dart';
import '../../widgets/custom_bottom_navigation.dart';
import '../auth/onboarding_screen.dart';
import '../../blocs/home/home_page_bloc.dart';

class HomeScreen extends StatelessWidget {
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
    // Items from navigation bar

    final itemsAppbar = <String>[
      S.of(context).menu_appbar_item1,
      S.of(context).menu_appbar_item2,
      S.of(context).menu_appbar_item3,
      S.of(context).menu_appbar_item4
    ];
    return Scaffold(
      extendBody: true,
      // backgroundColor: Theme.of(context).backgroundColor,
      // appBar: CustomAppBar(title: S.of(context).AppTitle, hasActions: true),
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       Image(
      //         image: AssetImage(S.of(context).logo_home),
      //         width: 55,
      //       ),
      //       Text(
      //         S.of(context).AppTitle,
      //       ),
      //     ],
      //   ),
      //   elevation: 10,
      //   actions: <Widget>[
      //     IconButton(
      //       tooltip: S.of(context).tooltip_bttn_shopping_card,
      //       icon: const Icon(Icons.shopping_cart),
      //       onPressed: () {},
      //     ),

      //     // PopupMenuButton<String>(
      //     //   tooltip: S.of(context).tooltip_bttn_options,
      //     //   onSelected: (index) {
      //     //     // Visitanos
      //     //     if (index == S.of(context).menu_appbar_item1) {
      //     //       Fluttertoast.showToast(
      //     //           msg: "Tab a visitanos",
      //     //           toastLength: Toast.LENGTH_SHORT,
      //     //           gravity: ToastGravity.BOTTOM,
      //     //           timeInSecForIosWeb: 1,
      //     //           backgroundColor: Colors.grey,
      //     //           textColor: Colors.white,
      //     //           fontSize: 16.0);
      //     //     }
      //     //     // setting screen
      //     //     if (index == S.of(context).menu_appbar_item2) {
      //     //       Navigator.pushNamed(context, SettingScreen.routeName);
      //     //     }
      //     //     // Ayuda
      //     //     if (index == S.of(context).menu_appbar_item3) {
      //     //       Fluttertoast.showToast(
      //     //           msg: "Tap a ayuda",
      //     //           toastLength: Toast.LENGTH_SHORT,
      //     //           gravity: ToastGravity.BOTTOM,
      //     //           timeInSecForIosWeb: 1,
      //     //           backgroundColor: Colors.grey,
      //     //           textColor: Colors.white,
      //     //           fontSize: 16.0);
      //     //     }
      //     //     // SignOut session
      //     //     if (index == S.of(context).menu_appbar_item4) {
      //     //       RepositoryProvider.of<AuthRepository>(context).signOut();
      //     //       context.read<AuthBloc>().add(const AuthUserChanged(user: null));
      //     //       Navigator.pushNamedAndRemoveUntil(
      //     //           context, '/', (route) => false);
      //     //     }
      //     //   },
      //     //   itemBuilder: (BuildContext context) {
      //     //     return itemsAppbar.map(
      //     //       (String choice) {
      //     //         return PopupMenuItem<String>(
      //     //           value: choice,
      //     //           child: Text(choice),
      //     //         );
      //     //       },
      //     //     ).toList();
      //     //   },
      //     // ),
      //   ],
      // ),
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
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
