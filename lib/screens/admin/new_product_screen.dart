import 'package:flutter/material.dart';

import '../../widgets/custom_dropdown_categories.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../generated/l10n.dart';

class NewProductScreen extends StatefulWidget {
  NewProductScreen({Key? key}) : super(key: key);

  @override
  State<NewProductScreen> createState() => _newProductState();
}

class _newProductState extends State<NewProductScreen> {
  final controller = CarouselController();
  // final List<String> tallas;
  final itemsTallas = <String>[];
  final List<String> itemsImages = [
    'graphics/images/Bestido 1_n.jpg',
  ];
  void _setText(title) {
    setState(() {
      itemsTallas.add(title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: const [
            Image(
              image: AssetImage("graphics/images/bely_logo-edit.png"),
              width: 55,
            ),
            Text("Bely Boutique Princess")
          ]),
          elevation: 8,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(30),
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PRODUCTO',
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        restorationId: 'txt_product',
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
                        restorationId: 'txt_desc_product',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Descripción',
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        restorationId: 'txt_price_product',
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
                ),
                const SizedBox(height: 10),
                const Text('CATEGORÍAS'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: Column(
                    children: const <Widget>[
                      CustomDropDownCategories(),
                    ],
                  ),
                ),
                const Text('Tallas o métricas'),
                const Divider(height: 15),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 320, maxHeight: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 160),
                        child: SingleChildScrollView(
                          primary: true,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: TextFormField(
                                  restorationId: 'txt_tallas_product',
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Ingresar tallas',
                                  ),
                                  onChanged: (text) => _setText(text),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: IconButton(
                          onPressed: () {},
                          iconSize: 50,
                          tooltip: 'Agregar otra edad',
                          icon: const Icon(
                            Icons.add_circle_outline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 10),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          child: IconButton(
                            onPressed: () {},
                            iconSize: 50,
                            tooltip: 'Agregar otra edad',
                            icon: const Icon(
                              Icons.add_photo_alternate_outlined,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: IconButton(
                            onPressed: () => controller.previousPage(),
                            iconSize: 50,
                            tooltip: 'Agregar otra edad',
                            icon:
                                const Icon(Icons.keyboard_arrow_left_outlined),
                          ),
                        ),
                        const VerticalDivider(width: 20),
                        SizedBox(
                          width: 180,
                          child: Column(children: <Widget>[
                            CarouselSlider(
                              items: itemsImages.map((e) {
                                // if (e.isNotEmpty) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: const BoxDecoration(
                                            color: Colors.black12),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image(
                                                image: AssetImage('$e'),

                                                // '$e',
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                );
                                // } else {
                                // return const Text("Error");
                                // }
                              }).toList(),
                              carouselController: controller,
                              options: CarouselOptions(
                                autoPlay: false,
                                enlargeCenterPage: false,
                                disableCenter: false,

                                // onPageChanged: , cuando cambie la pagina
                                viewportFraction: 0.8,
                                aspectRatio: 2.0,
                                initialPage: 0,
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          width: 40,
                          child: IconButton(
                            onPressed: () => controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear),
                            iconSize: 50,
                            tooltip: 'Agregar otra edad',
                            icon:
                                const Icon(Icons.keyboard_arrow_right_outlined),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}

/**
 * 
 * 
CarouselSlider(
                          items: itemsTallas.map((e) {
                            return Builder(builder: (BuildContext context) {
                              return SizedBox(
                                width: 150,
                                child: TextFormField(
                                  restorationId: 'txt_tallas_product',
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Ingresar tallas',
                                  ),
                                  onChanged: (text) => _setText(text),
                                  maxLines: 1,
                                ),
                              );
                            });
                          }).toList(),
                          options: CarouselOptions(
                              scrollDirection: Axis.horizontal, height: 70),
                          carouselController: controller,
                        ),







 * SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    primary: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            restorationId: 'txt_tallas_product',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Ingresar tallas',
                            ),
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            restorationId: 'txt_tallas_product',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Ingresar tallas',
                            ),
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            restorationId: 'txt_tallas_product',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Ingresar tallas',
                            ),
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            restorationId: 'txt_tallas_product',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Ingresar tallas',
                            ),
                            maxLines: 1,
                          ),
                        ),
                        const VerticalDivider(width: 15),
                        IconButton(
                          onPressed: () {},
                          iconSize: 55,
                          tooltip: 'Agregar otra edad',
                          icon: const Icon(
                            Icons.add_circle_outline,
                          ),
                        ),
                      ],
                    ),
                  ),
 * 
 * 
 * 
 * 
 * CustomScrollView(slivers: <Widget>[
        const SliverAppBar(
          pinned: false,
          expandedHeight: 280.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Name product'),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
          ),
        ),
      ]),
 */
