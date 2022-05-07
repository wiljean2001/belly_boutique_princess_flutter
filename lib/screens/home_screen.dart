import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../blocs/home/home_page_bloc.dart';
import '../repositories/repositories.dart';
import '../views/user_views.dart';
import '../widgets/custom_bottom_navigation.dart';
import 'auth/onboarding_screen.dart';
import '/views/home_view.dart';
import 'package:flutter/services.dart';

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
  // Seteo del bottom navigation opcions del sistema operativo

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<AuthBloc>(context).state.status ==
        AuthStatus.authenticated) {
      const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.pink,
        // systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.pink,
      );
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    }
    final views = [
      const UserProfileView(),
      const HomeView(),
      const ShoppingCartView(),
    ];
    // Items from navigati on bar
    const items = <Widget>[
      Icon(Icons.account_circle, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.shopping_cart, size: 30),
    ];

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Row(children: const [
          Image(
            image: AssetImage("graphics/images/bely_logo-edit.png"),
            width: 55,
          ),
          Text("Bely Boutique Princess")
        ]),
        elevation: 10,
        actions: <Widget>[
          IconButton(
            tooltip: "Carrito",
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            tooltip: "Opciones",
            onSelected: (index) {
              switch (index) {
                case 'Cerrar sesión':
                  RepositoryProvider.of<AuthRepository>(context).signOut();
                  context
                      .read<AuthBloc>()
                      .add(const AuthUserChanged(user: null));
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Visitanos', 'Configuracion', 'Ayuda', 'Cerrar sesión'}
                  .map(
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
            return const CircularProgressIndicator();
          }
          if (state is BottomNavigationInitial) {
            return views[state.indexBottomNav];
          }
          return const Text("Error al cargar las interfaces");
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(items: items),
    );
// return const HomeView();
  }
}
