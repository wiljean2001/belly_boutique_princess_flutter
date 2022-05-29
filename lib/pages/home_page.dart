import 'package:belly_boutique_princess/models/models.dart';
import 'package:belly_boutique_princess/widgets/Custom_loading_screen.dart';
import 'package:belly_boutique_princess/widgets/custom_sliver_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../generated/assets.dart';
import '../generated/l10n.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_dropdown_categories.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.2),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const CustomLoadingScreen();
          }
          if (state is ProductLoaded) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                CustomSliverAppBar(title: S.of(context).AppTitle),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCard(
                          context: context,
                          added: true,
                          imgPath:
                              'https://api.lorem.space/image/face?w=${150 + index}&h=${150 + index}',
                          isFavorite: true,
                          name: 'Bestido blanco',
                          price: '59.20',
                        ),
                      );
                    },
                    childCount: 20,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: 0,
                    // crossAxisSpacing: 0,
                    childAspectRatio: 0.65,
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildCard({
    required String name,
    required String price,
    required String imgPath,
    required bool added,
    required bool isFavorite,
    required BuildContext context,
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    isFavorite
                        ? const Icon(Icons.favorite, color: Color(0xFFEF7532))
                        : const Icon(Icons.favorite_border,
                            color: Color(0xFFEF7532))
                  ])),
              Hero(
                  tag: imgPath,
                  child: Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(imgPath),
                              fit: BoxFit.contain)))),
              const SizedBox(height: 7.0),
              Text(price,
                  style: const TextStyle(
                      color: Color(0xFFCC8053), fontSize: 14.0)),
              Text(name,
                  style: const TextStyle(
                      color: Color(0xFF575E67), fontSize: 14.0)),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Container(color: const Color(0xFFEBEBEB), height: 1.0)),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!added) ...[
                      const Icon(Icons.shopping_basket,
                          color: Color(0xFFD17E50), size: 12.0),
                      const Text('Add to cart',
                          style: TextStyle(
                              color: Color(0xFFD17E50), fontSize: 12.0))
                    ],
                    if (added) ...[
                      const Icon(Icons.remove_circle_outline,
                          color: Color(0xFFD17E50), size: 12.0),
                      const Text('3',
                          style: TextStyle(
                              color: Color(0xFFD17E50),
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0)),
                      const Icon(Icons.add_circle_outline,
                          color: Color(0xFFD17E50), size: 12.0),
                    ],
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/***
 * SliverPadding(
                    padding: EdgeInsets.all(8.0),
                    sliver: SliverFillRemaining(
                      // CustomAppBar(title: S.of(context).AppTitle, hasActions: true),
                      child: Wrap(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor),
                              child: Row(
                                children: [Text('SliverFillRemaining')],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor),
                              child: Row(
                                children: [Text('SliverFillRemaining')],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor),
                              child: Row(
                                children: [Text('SliverFillRemaining')],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor),
                              child: Row(
                                children: [Text('SliverFillRemaining')],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor),
                              child: Row(
                                children: [Text('SliverFillRemaining')],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor),
                              child: Row(
                                children: [Text('SliverFillRemaining')],
                              ),
                            ),
                          ),
                        ],
                      ),

                      // child: SliverGrid(
                      //   delegate: SliverChildBuilderDelegate(
                      //     (context, index) => Card(
                      //       child: DecoratedBox(
                      //         decoration: BoxDecoration(
                      //             color: Theme.of(context).primaryColor),
                      //         child: Row(),
                      //       ),
                      //     ),
                      //     childCount: 4,
                      //   ),
                      //   gridDelegate:
                      //       const SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //     mainAxisSpacing: 12.0,
                      //     crossAxisSpacing: 12.0,
                      //     childAspectRatio: 1.5,
                      //   ),
                      // ),
                    ),
                  ),
 */
