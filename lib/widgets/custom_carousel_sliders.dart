import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSliders extends StatelessWidget {
  const CustomCarouselSliders({
    Key? key,
    required this.itemsImages,
    required this.controller,
  }) : super(key: key);

  final List<dynamic> itemsImages;
  final CarouselController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => controller.previousPage(),
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Theme.of(context).primaryColorDark,
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
                                  child: Image.network(e),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ).toList()
                : [
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: Theme.of(context).primaryColorDark,
                      size: 65,
                    ),
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: Theme.of(context).primaryColorDark,
                      size: 65,
                    ),
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: Theme.of(context).primaryColorDark,
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
          child: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Theme.of(context).primaryColorDark,
            size: 45,
          ),
        ),
      ],
    );
  }
}
