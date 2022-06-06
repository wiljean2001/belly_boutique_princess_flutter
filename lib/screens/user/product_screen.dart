import 'package:belly_boutique_princess/utils/show_alert.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../widgets/Custom_loading_screen.dart';
import '../../widgets/custom_app_bar_avatar.dart';
import '../../widgets/custom_card_product.dart';
import '../../widgets/custom_carousel_sliders.dart';

// falta cambiar los textos a dinamicos

class ProductScreen extends StatefulWidget {
  static const String routeName = '/product'; //route

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) {
        // print the status user with the authbloc
        return ProductScreen(product: product);
      },
    );
  }

  final Product product;
  // pruebas:
  // final
  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  ProductScreenState createState() {
    return ProductScreenState(product);
  }
}

class ProductScreenState extends State<ProductScreen> {
  final Product product;
  ProductScreenState(this.product);

  final controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    List<String> itemsImages = [
      product.imageUrls[0],
      product.imageUrls[0],
      product.imageUrls[0],
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          TransitionAppBar(
            avatar: Image.network(
              product.imageUrls[0],
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
            withIcon: true,
            title: product.title,
            extent: 300,
            textTheme: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 22,
              shadows: [
                Shadow(color: Theme.of(context).primaryColor, blurRadius: 10)
              ],
            ),
            onTapIcon: () => Navigator.of(context).pop(),
          ),
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: Column(
                children: <Widget>[
                  CustomInfoProduct(product: product),
                  // const CustomInfoMiniProduct(),
                  // CustomCarouselSliders(
                  //   itImages: ,
                  // ),
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
          )
        ],
      ),
    );
  }
}

/**
 * body: SingleChildScrollView(
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
 */
//  Cambiarlo para recibir de la base de datos
class CustomExtraProducts extends StatelessWidget {
  const CustomExtraProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // alto de los cards
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const CustomLoadingScreen();
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return CustomCardProduct(
                name: "blusas",
                price: "2.00",
                imgPath:
                    'https://api.lorem.space/image/shoes?w=${150 + index}&h=${150 + index}',
                added: false,
                isFavorite: false,
                context: context,
                isShowAdd: false, // mostrar opciones
                isShowFavorite: false, // mostrar opcion fav
                onTap: () {},
              );
            },
          );
        },
      ),

      // return GridView.count(
      //   restorationId: 'grid_view_demo_grid_offset',
      //   crossAxisCount: 2,
      //   mainAxisSpacing: 8,
      //   crossAxisSpacing: 8,
      //   padding: const EdgeInsets.all(8),
      //   childAspectRatio: 1,
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
  final Product product;
  const CustomInfoProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: const [
          Divider(height: 10),
          // Text(product.title, style: const TextStyle(fontSize: 22)),
          Text("Bestido para damita con encajes...",
              style: TextStyle(fontSize: 18)),
          Text("...", style: TextStyle(fontSize: 18)),
          Text("...", style: TextStyle(fontSize: 18)),
        ],
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
