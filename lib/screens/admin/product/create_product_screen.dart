import 'package:belly_boutique_princess/screens/onboarding_auth/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../../../generated/assets.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_dropdown_categories.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../generated/l10n.dart';

class CreateProductScreen extends StatelessWidget {
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
        });
  }

  CreateProductScreen({Key? key}) : super(key: key);

  final controller = CarouselController();

  // final List<String> tallas;
  final itemsTallas = <String>[];
  final List<String> itemsImages = [
    // Assets.imagesBestido1N,
    // Assets.imagesBestido1N,
    // Assets.imagesBestido1N,
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        // padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: S.of(context).title_new_product_screen,
              hasActions: false,
              hasIcon: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                        const FormProduct(),
                        const SizedBox(height: 10),
                        Text(
                          'CATEGORÍAS',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: CustomDropDownCategories(),
                        ),
                        Text(
                          'TALLAS Y MÉTRICAS',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const FormSizes(),
                        CustomCarouselSliders(
                          itemsImages: itemsImages,
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// crashing
class FormSizes extends StatelessWidget {
  const FormSizes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                child: Text(
                  'Seleccionar tallas',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Theme.of(context).primaryColorLight),
                ),
              ),
              // child: SizedBox(
              //   // width: MediaQuery.of(context).size.width * 0.6,
              //   child: TextFormField(
              //     textInputAction: TextInputAction.next,
              //     keyboardType: TextInputType.text,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: 'Tallas',
              //       suffixText: 'Tallas',
              //     ),
              //     // maxLines: null,
              //   ),
              // ),
            ),
            const SizedBox(
              width: 15,
            ),
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.add_circle_outline,
                  size: 45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormProduct extends StatelessWidget {
  const FormProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre',
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Descripción',
            ),
            // maxLines: 3,
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
          ),
        ],
      ),
    );
  }
}

class CustomCarouselSliders extends StatelessWidget {
  const CustomCarouselSliders({
    Key? key,
    required this.itemsImages,
    required this.controller,
  }) : super(key: key);

  final List<String> itemsImages;
  final CarouselController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => controller.previousPage(),
          child: const Icon(
            Icons.keyboard_arrow_left_outlined,
            size: 45,
          ),
        ),
        Expanded(
          child: CarouselSlider(
            items: itemsImages.isNotEmpty
                ? itemsImages.map(
                    (e) {
                      // if (e.isNotEmpty) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // TODO: Open galery
                                  },
                                  child: Image(
                                    image: AssetImage(e),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ).toList()
                : [
                    const Icon(
                      Icons.add_a_photo_outlined,
                      size: 65,
                    ),
                    const Icon(
                      Icons.add_a_photo_outlined,
                      size: 65,
                    ),
                    const Icon(
                      Icons.add_a_photo_outlined,
                      size: 65,
                    ),
                  ],
            carouselController: controller,
            options: CarouselOptions(
              // autoPlay: true,
              enlargeCenterPage: true,
              height: 170,
              disableCenter: false,
              enableInfiniteScroll: false,
              onPageChanged: (
                indexPage,
                carousel,
              ) {
                // cuando cambie la pagina
              },
              viewportFraction: 0.5,
              aspectRatio: 2.0,
              initialPage: 1,
            ),
          ),
        ),
        TextButton(
          onPressed: () => controller.nextPage(),
          child: const Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 45,
          ),
        ),
      ],
    );
  }
}
