import 'package:belly_boutique_princess/models/models.dart';
import 'package:belly_boutique_princess/screens/onboarding_auth/onboarding_screen.dart';
import 'package:belly_boutique_princess/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../blocs/blocs.dart';
import '../../../config/constrants.dart';
import '../../../widgets/custom_carousel_sliders.dart';
import '../../../widgets/custom_multi_dropdown.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/custom_sliver_app_bar.dart';

class CreateProductScreen extends StatefulWidget {
  static const String routeName = '/admin/nuevo/producto'; //route

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) {
        // print the status user with the authbloc
        print(BlocProvider.of<AuthBloc>(context).state.status);

        return BlocProvider.of<AuthBloc>(context).state.status ==
                AuthStatus.unauthenticated
            ? const OnboardingScreen()
            : CreateProductScreen();
      },
    );
  }

  CreateProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final controller = CarouselController();

  // images product
  List<String>? itemsImages = [];
  List? categoriesProduct = [];
  List? sizesProduct = [];
  String? title;
  String? description;
  String? price;

  List<String> listItems = ['XXS', 'XS', 'S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            title: S.of(context).title_create_product_screen,
            hasActions: false,
            hasIcon: false,
            isTextCenter: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(kPaddingM),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'PRODUCTO',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    formProduct(),
                    const SizedBox(height: 10),
                    Text(
                      'CATEGORÍAS',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    // TODO: Categories
                    BlocBuilder<CategoryBloc, CategoryState>(
                      builder: (context, state) {
                        if (state is CategoryLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is CategoryLoaded) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kPaddingL, vertical: kPaddingS),
                            child: CustomDropDown(
                              title: const Text('Categorías'),
                              listItems: state.categories
                                  .map((e) => MultiSelectItem(e.name, e.name))
                                  .toList(),
                              buttonText: const Text('Seleccionar categorías'),
                              onConfirm: (List<Object?> values) {
                                categoriesProduct = [];
                                categoriesProduct = values;
                              },
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                    Text(
                      'TALLAS Y MÉTRICAS',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    // TODO: Sizes product
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kPaddingL, vertical: kPaddingS),
                      child: CustomDropDown(
                        buttonText: const Text('Seleccionar tallas'),
                        listItems: listItems
                            .map((e) => MultiSelectItem(e, e))
                            .toList(),
                        onConfirm: (List<Object?> values) {
                          sizesProduct = [];
                          sizesProduct = values;
                        },
                        title: const Text('Tallas'),
                      ),
                    ),
                    CustomCarouselSliders(
                      itemsImages: itemsImages!,
                      controller: controller,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.4),
                        child: MaterialButton(
                          color: Theme.of(context).primaryColor,
                          elevation: 8.0,
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            print(sizesProduct);
                            print(categoriesProduct);
                            if (sizesProduct!.length > 0 &&
                                categoriesProduct!.length > 0) {
                              // validar por  espacio
                              Product product = Product(
                                title: title!,
                                descript: description!,
                                price: double.parse(price!),
                                imageUrls: [],
                                sizes: sizesProduct!,
                                categories: categoriesProduct!,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Succes'),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Por favor completa el registro.'),
                                ),
                              );
                            }
                          },
                          child: ListTile(
                            textColor: Theme.of(context).primaryColorLight,
                            iconColor: Theme.of(context).primaryColorLight,
                            // trailing: Icon(Icons.save_outlined),
                            title: const Text('Guardar'),
                            leading: const Icon(Icons.save_outlined),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MediaQuery.of(context).size.width * 0.5,
          //       right: kPaddingM),
          //   child: MaterialButton(
          //     onPressed: () {},
          //     child: ListTile(
          //       title: Text('Guardar'),
          //       leading: Icon(Icons.save_outlined),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget formProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kPaddingL, vertical: kPaddingS),
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre',
            ),
            validator: (value) => Validators.isValidateOnlyTextMinMax(
              text: value!,
              minCaracter: 3,
              maxCarater: 35,
              messageError: 'Nombre no valido.',
            ),
            onChanged: (value) => title = value,
            maxLines: 1,
          ),
          const SizedBox(height: kPaddingS),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Descripción',
            ),
            validator: (value) => Validators.isValidateOnlyTextMinMax(
              text: value!,
              minCaracter: 3,
              maxCarater: 50,
              messageError: 'Descripción no valido.',
            ),
            onChanged: (value) => description = value,
          ),
          const SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Costo',
              suffixText: 'Soles',
              prefixText: 'S/',
            ),
            maxLines: 1,
            validator: (value) => Validators.isValidateOnlyTextMinMax(
              text: value!,
              minCaracter: 1,
              maxCarater: 5,
              messageError: 'Costo no valido.',
            ),
            onChanged: (value) => price = value,
          ),
        ],
      ),
    );
  }
}
