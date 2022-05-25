import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../widgets/custom_appbar.dart';

class UpdateProductScreen extends StatelessWidget {
  const UpdateProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.2),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
                title: S.of(context).title_update_product_screen,
                hasActions: false),
            Expanded(
              child: Column(
                children: [Text('')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
