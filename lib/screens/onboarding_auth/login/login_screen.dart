import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '/widgets/curved_widget.dart';
import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  final TabController tabController;

  const LoginScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState(tabController: tabController);
}

class _LoginScreenState extends State<LoginScreen> {
  final TabController tabController;

  _LoginScreenState({required this.tabController});

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
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: <Widget>[
            CurvedWidget(
              mode: 2,
              //curved widget with logo
              chield: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 45, horizontal: 40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white70.withOpacity(0.5),
                      ]),
                ),
                width: double.infinity,
                height: 355,
                child: const Image(
                  image: AssetImage(Assets.imagesLogoCoronaTexto),
                  alignment: Alignment.topCenter,
                ),
                // Text("Login",
                // style: primaryTextStyle.copyWith(
                // color: Colors.black, fontSize: 40)),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 355),
              height: 350,
              // constraints: BoxConstraints(ma),
              child: LoginForm(
                tabController: tabController,
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
