// screen Start

import 'package:flutter/material.dart';

import '../../config/theme_default.dart';
import '../../widgets/curved_widget.dart';
import '../../widgets/custom_button_gradiant.dart';

class StartScreen extends StatelessWidget {
  final TabController tabController;

  const StartScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(225, 242, 203, 208),
            Color(0xfff4ced9),
          ],
        ),
      ),
      height: double.infinity,
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            CurvedWidget(
              mode: 2,
              //curved widget with logo
              chield: Container(
                padding: const EdgeInsets.only(top: 100),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.5),
                      ]),
                ),
                width: double.infinity,
                height: 400,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Image(
                        image: AssetImage('graphics/images/LOGO4-small.png'),
                        // alignment: Alignment.topCenter,
                      ),
                    ),
                  ],
                ),
                // Text("Login",
                // style: primaryTextStyle.copyWith(
                // color: Colors.black, fontSize: 40)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 400),
              alignment: Alignment.center,
              height: 250,
              // constraints: BoxConstraints(ma),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Bienvenido",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "Esta es una tienda que se dedica a vender vestidos para las princesas de casa.",
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomButtonGradiant(
                    text: const Text(
                      "    Empezar",
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.start,
                      color: Colors.white,
                    ),
                    height: 55,
                    width: 200,
                    onPressed: () =>
                        tabController.animateTo(tabController.index + 1),
                  )
                ],
              ),
            ),
          ],
          // ),
          //     ),
        ),
      ),
    );
  }
}
