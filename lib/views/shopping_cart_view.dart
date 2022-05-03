import 'package:belly_boutique_princess/config/theme_dark.dart';
import 'package:flutter/material.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hola",
              style: themedark().textTheme.headline3?.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}




















