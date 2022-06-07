import 'package:bely_boutique_princess/models/models.dart';
import 'package:bely_boutique_princess/screens/user/product_screen.dart';
import 'package:bely_boutique_princess/widgets/Custom_loading_screen.dart';
import 'package:bely_boutique_princess/widgets/custom_card_product.dart';
import 'package:bely_boutique_princess/widgets/custom_sliver_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  bool isShowProducts = true;
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.2),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const CustomLoadingScreen();
          }
          if (state is ProductsLoaded) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                CustomSliverAppBar(title: S.of(context).AppTitle),
                SliverToBoxAdapter(
                  child: MaterialButton(
                    onPressed: () => setState(() {
                      isShowProducts
                          ? isShowProducts = false
                          : isShowProducts = true;
                    }),
                    child: Text('Ver productos normales'),
                  ),
                ),
                isShowProducts
                    ? SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            Product product = Product(
                              title: 'Vestido blanco',
                              descript: 'Vestido blanco',
                              imageUrls: [
                                'https://api.lorem.space/image/shoes?w=${150 + index}&h=${150 + index}'
                              ],
                              sizes: const ['19.50'],
                              price: 59.20,
                              categories: [],
                            );
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomCardProduct(
                                context: context,
                                added: true,
                                imgPath: product.imageUrls[0],
                                isFavorite: false,
                                name: product.title,
                                price: product.sizes[0],
                                onTap: () => Navigator.of(context).pushNamed(
                                    ProductScreen.routeName,
                                    arguments: product),
                              ),
                            );
                          },
                          childCount: 20,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // mainAxisSpacing: 0,
                          // crossAxisSpacing: 0,
                          childAspectRatio: 0.65,
                        ),
                      )
                    : SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomCardProduct(
                                context: context,
                                added: true,
                                imgPath: state
                                        .products[index].imageUrls.isNotEmpty
                                    ? state.products[index].imageUrls[0]
                                    : 'https://api.lorem.space/image/shoes?w=${150 + index}&h=${150 + index}',
                                isFavorite: false,
                                name: state.products[index].title,
                                price: 'S/ ${state.products[index].price}',
                                onTap: () => Navigator.of(context).pushNamed(
                                    ProductScreen.routeName,
                                    arguments: state.products[index]),
                              ),
                            );
                          },
                          childCount: state.products.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
