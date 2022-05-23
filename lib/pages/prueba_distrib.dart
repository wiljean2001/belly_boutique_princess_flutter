import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../widgets/custom_appbar.dart';

// falta cambiar los textos a dinamicos

class PruebaDistrib extends StatelessWidget {
  const PruebaDistrib({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomAppBar(title: S.of(context).AppTitle, hasActions: false),
            Expanded(
              child: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  if (orientation == Orientation.portrait) {
                    return Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.88,
                                  child: Image.network(
                                      'https://i.pinimg.com/564x/2f/2d/86/2f2d86d77303c07fe5591a7ad65d4ea4.jpg',
                                      fit: BoxFit.fitHeight),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                  MediaQuery.of(context).size.height * 0.88,
                                  child: Image.network(
                                      'https://i.pinimg.com/564x/2f/2d/86/2f2d86d77303c07fe5591a7ad65d4ea4.jpg',
                                      fit: BoxFit.fitHeight),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              //width:MediaQuery.of(context).size.width/2,
                              height:
                                  MediaQuery.of(context).size.height / 2 * 0.88,
                              child: Image.network(
                                  'https://i.pinimg.com/564x/2f/2d/86/2f2d86d77303c07fe5591a7ad65d4ea4.jpg',
                                  fit: BoxFit.fitHeight),
                            ),
                            SizedBox(
                              //width:MediaQuery.of(context).size.width/2,
                              height:
                                  MediaQuery.of(context).size.height / 2 * 0.88,
                              child: Image.network(
                                  'https://i.pinimg.com/564x/2f/2d/86/2f2d86d77303c07fe5591a7ad65d4ea4.jpg',
                                  fit: BoxFit.fitHeight),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              'https://i.pinimg.com/564x/2f/2d/86/2f2d86d77303c07fe5591a7ad65d4ea4.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Image.network(
                                  'https://i.pinimg.com/564x/2f/2d/86/2f2d86d77303c07fe5591a7ad65d4ea4.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Image.network(
                                  'https://i.pinimg.com/564x/2f/2d/86/2f2d86d77303c07fe5591a7ad65d4ea4.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Image.network(
                                  'https://i.pinimg.com/564x/2f/2d/86/2f2d86d77303c07fe5591a7ad65d4ea4.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Image.network(
                                  'https://i.pinimg.com/564x/2f/2d/86/2f2d86d77303c07fe5591a7ad65d4ea4.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Image.network(
                                  'https://i.pinimg.com/564x/2f/2d/86/2f2d86d77303c07fe5591a7ad65d4ea4.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
