import '/models/user_model.dart';
import 'package:flutter/material.dart';

import '../screens/user/product_screen.dart';
import '../screens/admin/new_product_screen.dart';

class CustomScrollViewProducts extends StatefulWidget {
  const CustomScrollViewProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomScrollViewProducts> createState() =>
      _CustomScrollViewProductsState();
}

class _CustomScrollViewProductsState extends State<CustomScrollViewProducts> {
  Color colorcard = Colors.pink;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // restorationId: 'grid_view_demo_grid_offset',
      primary: true,
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      childAspectRatio: 1,
      children: User.users.map<Widget>((User product) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProductScreen();
            }));
          },
          child: GridTile(
            footer: Material(
              color: Color.fromARGB(0, 255, 0, 0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
              ),
              clipBehavior: Clip.antiAlias,
              child: GridTileBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.name),
                    Text(product.gender),
                  ],
                ),
                backgroundColor: Colors.black45,
              ),
            ),
            // Buscar la forma de almacenar las imagenes
            child: const Image(
                image: AssetImage('graphics/images/Bestido 1_n.jpg')),
          ),
        );
      }).toList(),
    );
  }
}
