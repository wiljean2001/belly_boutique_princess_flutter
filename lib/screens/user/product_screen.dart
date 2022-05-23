import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../onboarding_auth/onboarding_screen.dart';

// falta cambiar los textos a dinamicos

class ProductScreen extends StatefulWidget {
  static const String routeName = '/producto'; //route

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) {
        // print the status user with the authbloc
        print(BlocProvider.of<AuthBloc>(context).state.status);

        return BlocProvider.of<AuthBloc>(context).state.status ==
            AuthStatus.unauthenticated
            ? const OnboardingScreen()
            : const ProductScreen();
      },
    );
  }

  const ProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  ProductScreenState createState() {
    return ProductScreenState();
  }
}

class ProductScreenState extends State<ProductScreen> {
  ProductScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Producto",
        ),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: <Widget>[
              const CustomInfoProduct(),
              const CustomInfoMiniProduct(),
              const Divider(
                height: 10,
                color: Colors.black,
                endIndent: 20,
                indent: 20,
              ),
              Container(
                height: 250,
                child: CustomExtraProducts(),
                // color: Colors.red,
              ),
            ],
          ),
        ),
      ),
      // body: BlocBuilder<ProductBloc, ProductState>(
      //   builder: (context, state) {},
      // ),
    );
  }
}

//  Cambiarlo para recibir de la base de datos
class CustomExtraProducts extends StatelessWidget {
  const CustomExtraProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      restorationId: 'grid_view_demo_grid_offset',
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      childAspectRatio: 1,
      // children: Product.products().map<Widget>((photo) {
      //   return GridTile(
      //     header: Material(
      //       color: Colors.transparent,
      //       shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
      //       ),
      //       clipBehavior: Clip.antiAlias,
      //       child: GridTileBar(
      //         title: Text(photo.name),
      //         backgroundColor: Colors.black45,
      //       ),
      //     ),
      //     child: Image(image: AssetImage('graphics/images/Bestido1_n.jpg')),
      //   );
      //   ;
      // }).toList(),
    );
  }
}

class CustomInfoMiniProduct extends StatelessWidget {
  const CustomInfoMiniProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.keyboard_arrow_left,
                  size: 55,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 270),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    primary: true,
                    child: Row(
                      children: const [
                        _CustomMiniProduct(icon: Icons.shopping_bag),
                        _CustomMiniProduct(icon: Icons.shopping_bag),
                        _CustomMiniProduct(icon: Icons.shopping_bag),
                        _CustomMiniProduct(icon: Icons.shopping_bag),
                      ],
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 55,
                ),
              ],
            ),
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: const Text("Solicitar"),
                icon: const Icon(Icons.add_shopping_cart),
              ),
            ),
          ],
        ),
      ),
      // color: Colors.blue,
    );
  }
}

class CustomInfoProduct extends StatelessWidget {
  const CustomInfoProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(10),
      child: Expanded(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {}, // Tap para abrir pantalla completa de la imagen
                child: const Image(
                  image: AssetImage('graphics/images/Bestido1_n.jpg'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: const [
                  Divider(height: 10),
                  Text("Bestido blanco", style: TextStyle(fontSize: 22)),
                  Text("Bestido para damita con encajes...",
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomMiniProduct extends StatelessWidget {
  final IconData icon;
  const _CustomMiniProduct({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(icon, size: 90),
      ],
    );
  }
}
