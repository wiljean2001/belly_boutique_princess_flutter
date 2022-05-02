import 'package:flutter/material.dart';

import '../widgets/custom_dropdown_categories.dart';
import '../widgets/custom_scrollview_products.dart';

class HomeProductsView extends StatefulWidget {
  const HomeProductsView({
    Key? key,
  }) : super(key: key);

  @override
  _HomeProductsViewState createState() => _HomeProductsViewState();
}

class _HomeProductsViewState extends State<HomeProductsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDropDownCategories(),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height - 210,
                width: MediaQuery.of(context).size.width),
            child: Column(
              children: const <Widget>[
                Expanded(child: CustomScrollViewProducts()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
