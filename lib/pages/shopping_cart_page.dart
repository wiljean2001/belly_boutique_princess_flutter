import 'package:belly_boutique_princess/pages/shopping_controler.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_sliver_app_bar.dart';

// falta cambiar los textos a dinamicos

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 40),
                    child: Text(
                      'Cesta',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  _CustomProductSpace(),
                  Divider(
                    indent: 90.0,
                    endIndent: 90.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      'Seguro te gustara',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//espacio de trabajo
class _CustomProductSpace extends StatelessWidget {
  const _CustomProductSpace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_cart,
              color: Color(0xA9A9A9A9),
              size: 120,
            ),
            Text(
              'No hay nada en tu cesta',
              style: TextStyle(
                color: Color(0xA9A9A9A9),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
