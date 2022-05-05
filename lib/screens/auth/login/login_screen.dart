import 'package:flutter/material.dart';

// import 'package:bely_boutique/theme.dart';
import '/widgets/curved_widget.dart';
import 'package:flutter/services.dart';
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
    // return Scaffold(
    // extendBodyBehindAppBar: true,
    // appBar: AppBar(
    //   iconTheme: const IconThemeData(color: Colors.black),
    //   elevation: 0,
    //   backgroundColor: Colors.transparent,
    // ),
    // body:
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
                padding: const EdgeInsets.only(top: 40),
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
                height: 300,
                child: const Image(
                  image: AssetImage('graphics/images/LOGO4-small.png'),
                  alignment: Alignment.topCenter,
                ),
                // Text("Login",
                // style: primaryTextStyle.copyWith(
                // color: Colors.black, fontSize: 40)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 280),
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
