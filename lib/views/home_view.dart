import 'package:belly_boutique_princess/blocs/auth/auth_bloc.dart';
import 'package:belly_boutique_princess/views/profile_user.dart';

import '../widgets/custom_dropdown_categories.dart';
import '../widgets/custom_scrollview_products.dart';
import '/blocs/home/home_page_bloc.dart';
import '/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '/views/shopping_cart_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/repositories.dart';
import '../widgets/custom_bottom_navigation.dart';

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
