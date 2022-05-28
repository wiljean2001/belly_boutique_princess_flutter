import 'package:belly_boutique_princess/pages/shopping_controler.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../widgets/custom_appbar.dart';

// falta cambiar los textos a dinamicos

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomAppBar(title: S.of(context).AppTitle, hasActions: false),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: AlignmentDirectional(-0.85, 0),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Cesta(1)',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 90, 0, 5),
                              child: Icon(
                                Icons.shopping_cart,
                                color: Color(0xA9A9A9A9),
                                size: 120,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'No hay nada en tu cesta',
                                style: TextStyle(
                                  color: Color(0xA9A9A9A9),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.85, 0),
                            child: Text(
                              'Seguro te gustara',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 500,
                            child: PageView(
                              physics: BouncingScrollPhysics(),
                              children: [shopping_controller()],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
