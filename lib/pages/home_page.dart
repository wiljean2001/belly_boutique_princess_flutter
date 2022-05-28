import 'package:belly_boutique_princess/models/models.dart';
import 'package:belly_boutique_princess/widgets/Custom_loading_screen.dart';
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
            // return Column(
            //   children: [
            //     CustomAppBar(title: S.of(context).AppTitle, hasActions: true),
            //     Expanded(child: Text('s'))
            //   ],
            // );
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: false,
                  snap: false,
                  // backgroundColor: Colors.transparent,
                  floating: true,
                  elevation: 8.0,
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(Assets.imagesLocoCorona),
                        width: 45,
                      ),
                      Text(
                        S.of(context).AppTitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8),
                      child: Container(
                        width: AppBar().preferredSize.height - 8,
                        height: AppBar().preferredSize.height - 8,
                        color: Colors.transparent,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                                AppBar().preferredSize.height),
                            child: Tooltip(
                              message:
                                  S.of(context).tooltip_bttn_search_products,
                              child: Icon(Icons.search_outlined,
                                  color: Theme.of(context).primaryColorLight),
                            ),
                            // onTap: () => onTapOption != null ? onTapOption!() : {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Sliver
              ],
            );
          }
          return SizedBox();
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
