import 'package:belly_boutique_princess/models/models.dart';
import 'package:belly_boutique_princess/widgets/Custom_loading_screen.dart';
import 'package:belly_boutique_princess/widgets/custom_card_product.dart';
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
                        child: CustomCardProduct(
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
