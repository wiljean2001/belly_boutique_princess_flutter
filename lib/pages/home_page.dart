import '../generated/l10n.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_dropdown_categories.dart';
import '../widgets/custom_scrollview_products.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: S.of(context).AppTitle, hasActions: true),
            // const CustomDropDownCategories(), // Cegories dropdown
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Expanded(
                child: Text('hola'),
              ),
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.vertical,
            //   child: ConstrainedBox(
            //     constraints: BoxConstraints.expand(
            //       height: MediaQuery.of(context).size.height - 180,
            //     ),
            //     child: CustomScrollViewProducts(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
