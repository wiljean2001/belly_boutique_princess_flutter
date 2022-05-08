import '../widgets/custom_dropdown_categories.dart';
import '../widgets/custom_scrollview_products.dart';
import '/blocs/home/home_page_bloc.dart';
import '/screens/product_screen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const CustomDropDownCategories(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height - 210,
                width: MediaQuery.of(context).size.width,
              ),
              child: Column(
                children: const <Widget>[
                  Expanded(
                    child: CustomScrollViewProducts(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
