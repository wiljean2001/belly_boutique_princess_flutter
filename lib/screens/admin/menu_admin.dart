import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../screens.dart';
import '/screens/admin/new_product_screen.dart';
import 'package:flutter/material.dart';

class MenuAdmintration extends StatelessWidget {
  static const String routeName = '/admin'; //route
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          // print the status user with the authbloc
          print(BlocProvider.of<AuthBloc>(context).state.status);

          return BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.unauthenticated
              ? const OnboardingScreen()
              : const MenuAdmintration();
        });
  }

  const MenuAdmintration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(children: const [
      //     Image(
      //       image: AssetImage("graphics/images/bely_logo-edit.png"),
      //       width: 55,
      //     ),
      //     Text("Bely Boutique Princess")
      //   ]),
      //   elevation: 8,
      //   actions: [],
      // ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: const CustomOptions(),
      ),
    );
  }
}

class CustomOptions extends StatelessWidget {
  const CustomOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: <Widget>[
        Container(
          color: Color.fromARGB(31, 177, 177, 177),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NewProductScreen();
              }));
            },
            child: const GridTile(
              footer: Material(
                color: Color.fromARGB(0, 255, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                ),
                clipBehavior: Clip.antiAlias,
                child: GridTileBar(
                  title: Text(
                    "NUEVO PRODUCTO",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  // backgroundColor: Colors.black45,
                ),
              ),
              // Buscar la forma de almacenar las imagenes
              child: Icon(
                Icons.addchart,
                size: 80,
              ),
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(31, 177, 177, 177),
          child: GestureDetector(
            onTap: () {},
            child: const GridTile(
              footer: Material(
                color: Color.fromARGB(0, 255, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                ),
                clipBehavior: Clip.antiAlias,
                child: GridTileBar(
                  title: Text(
                    "EDITAR PRODUCTO",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  // backgroundColor: Colors.black45,
                ),
              ),
              // Buscar la forma de almacenar las imagenes
              child: Icon(
                Icons.edit,
                size: 80,
              ),
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(31, 177, 177, 177),
          child: GestureDetector(
            onTap: () {},
            child: const GridTile(
              footer: Material(
                color: Color.fromARGB(0, 255, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                ),
                clipBehavior: Clip.antiAlias,
                child: GridTileBar(
                  title: Text(
                    "CATEGORÍA",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  // backgroundColor: Colors.black45,
                ),
              ),
              // Buscar la forma de almacenar las imagenes
              child: Icon(
                Icons.category_outlined,
                size: 80,
              ),
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(31, 177, 177, 177),
          child: GestureDetector(
            onTap: () {},
            child: const GridTile(
              footer: Material(
                color: Color.fromARGB(0, 255, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                ),
                clipBehavior: Clip.antiAlias,
                child: GridTileBar(
                  title: Text(
                    "[...]",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  // backgroundColor: Colors.black45,
                ),
              ),
              // Buscar la forma de almacenar las imagenes
              child: Icon(
                Icons.add,
                size: 80,
              ),
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(31, 177, 177, 177),
          child: GestureDetector(
            onTap: () {},
            child: const GridTile(
              footer: Material(
                color: Color.fromARGB(0, 255, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                ),
                clipBehavior: Clip.antiAlias,
                child: GridTileBar(
                  title: Text(
                    "[...]",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  // backgroundColor: Colors.black45,
                ),
              ),
              // Buscar la forma de almacenar las imagenes
              child: Icon(
                Icons.add,
                size: 80,
              ),
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(31, 177, 177, 177),
          child: GestureDetector(
            onTap: () {},
            child: const GridTile(
              footer: Material(
                color: Color.fromARGB(0, 255, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                ),
                clipBehavior: Clip.antiAlias,
                child: GridTileBar(
                  title: Text(
                    "[...]",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  // backgroundColor: Colors.black45,
                ),
              ),
              // Buscar la forma de almacenar las imagenes
              child: Icon(
                Icons.add,
                size: 80,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
/** 
 * InteractiveViewer(
          boundaryMargin: EdgeInsets.all(20.0),
          minScale: 0.1,
          maxScale: 1.6,
          child: Image(image: AssetImage("graphics/images/Bestido 1_n.jpg")),
        ),
 */