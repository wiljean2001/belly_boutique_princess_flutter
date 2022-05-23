import 'package:flutter/cupertino.dart';
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
              child: Text('tu no has visto nada')
            ),
          ],
        ),
      ),
    );
  }
}
