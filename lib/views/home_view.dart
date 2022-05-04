import 'package:belly_boutique_princess/blocs/auth/auth_bloc.dart';
import 'package:belly_boutique_princess/views/profile_user.dart';

import '/blocs/home/home_page_bloc.dart';
import '/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '/views/shopping_cart_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/repositories.dart';
import '../widgets/custom_bottom_navigation.dart';
import 'home_products_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final views = [
      const UserProfileView(),
      const HomeProductsView(),
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
                  Navigator.pushNamed(context, '/');
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
  }
}
