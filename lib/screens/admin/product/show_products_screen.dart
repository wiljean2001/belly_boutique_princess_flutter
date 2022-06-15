import 'package:bely_boutique_princess/blocs/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/constrants.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/custom_sliver_app_bar.dart';

class ShowProductsScreen extends StatefulWidget {
  const ShowProductsScreen({Key? key}) : super(key: key);

  @override
  State<ShowProductsScreen> createState() => _ShowProductsScreenState();
}

class _ShowProductsScreenState extends State<ShowProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.2),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          CustomSliverAppBar(
            title: S.of(context).title_show_products_screen,
            hasActions: false,
            hasIcon: false,
            isTextCenter: false,
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductsLoaded) {
                  int contIndex = 0;
                  return Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading: new Icon(Icons.search),
                          title: new TextFormField(
                            decoration: new InputDecoration(
                                hintText: 'Search', border: InputBorder.none),
                            onChanged: (value) {
                              // setState(() {
                              //   _searchResult = value;
                              //   usersFiltered = users
                              //       .where((user) =>
                              //           user.name.contains(_searchResult) ||
                              //           user.role.contains(_searchResult))
                              //       .toList();
                              // });
                            },
                          ),
                          trailing: new IconButton(
                            icon: new Icon(Icons.cancel),
                            onPressed: () {
                              // setState(() {
                              //   controller.clear();
                              //   _searchResult = '';
                              //   usersFiltered = users;
                              // });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kPaddingM),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            // showBottomBorder: true,
                            // headingRowColor: MaterialStateProperty.all<Color>(
                            //   Theme.of(context).primaryColorLight.withOpacity(.3),
                            // ),
                            // dataRowColor: MaterialStateProperty.all<Color>(
                            //   Theme.of(context).primaryColorLight.withOpacity(.1),
                            // ),
                            // headingTextStyle: Theme.of(context)
                            //     .textTheme
                            //     .titleMedium
                            //     ?.copyWith(fontWeight: FontWeight.bold),
                            dataRowHeight: 70,
                            sortAscending: true,
                            columns: const [
                              DataColumn(
                                label: Text('N°',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic)),
                                numeric: true,
                              ),
                              DataColumn(
                                label: Text('Nombre',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic)),
                                // onSort: (i, b) {
                                //   setState(() {
                                //     state.products.sort(
                                //       (a, b) => a.title.compareTo(b.title),
                                //     );
                                //   });
                                // },
                              ),
                              DataColumn(
                                label: Text('Desc.',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic)),
                              ),
                              DataColumn(
                                label: Text('Imagen',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic)),
                              ),
                            ],
                            rows: state.products.isNotEmpty
                                ? state.products.map<DataRow>((e) {
                                    contIndex += 1;
                                    return DataRow(
                                      onLongPress: () {},
                                      cells: [
                                        DataCell(Text(contIndex.toString())),
                                        DataCell(Text(e.title)),
                                        DataCell(
                                          Text(
                                            e.descript,
                                            // maxLines: null,
                                          ),
                                        ),
                                        DataCell(
                                          Image.network(
                                            e.imageUrls.isNotEmpty
                                                ? e.imageUrls[0]
                                                : 'https://api.lorem.space/image/shoes?w=150&h=150',
                                            width: 60,
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList()
                                : [],
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
