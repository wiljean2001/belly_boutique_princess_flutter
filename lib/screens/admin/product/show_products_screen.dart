import 'package:bely_boutique_princess/blocs/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../widgets/custom_sliver_app_bar.dart';

class ShowProductsScreen extends StatelessWidget {
  const ShowProductsScreen({Key? key}) : super(key: key);

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
                  return DataTable(
                    headingRowColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColorLight.withOpacity(.3),
                    ),
                    dataRowColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColorLight.withOpacity(.1),
                    ),
                    headingTextStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    columns: const [
                      DataColumn(
                          label: Text('N°',
                              style: TextStyle(fontStyle: FontStyle.italic)),
                          numeric: true),
                      DataColumn(
                          label: Text('Categoría',
                              style: TextStyle(fontStyle: FontStyle.italic))),
                      DataColumn(
                          label: Text('Imagen',
                              style: TextStyle(fontStyle: FontStyle.italic))),
                    ],
                    rows: state.products != null
                        ? state.products.map<DataRow>((e) {
                            contIndex += 1;
                            return DataRow(
                              cells: [
                                DataCell(Text(contIndex.toString())),
                                DataCell(Text(e.title)),
                                DataCell(Text('e.imageUrl')),
                              ],
                            );
                          }).toList()
                        : [],
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
