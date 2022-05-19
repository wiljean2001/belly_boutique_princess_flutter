import 'package:flutter/material.dart';

import '/widgets/curved_widget.dart';

import 'register_form.dart';

class RegisterScreen extends StatelessWidget {
  final TabController tabController;
  const RegisterScreen({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   appBar: AppBar(
    //     iconTheme: const IconThemeData(color: Colors.black),
    //     elevation: 0,
    //     backgroundColor: Colors.transparent,
    //   ),
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
              //curved widget with logo
              chield: Container(
                padding: const EdgeInsets.only(left: 50, top: 100),
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
                child: const Text("Registrar",
                    style: TextStyle(color: Colors.black, fontSize: 40)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 220),
              // constraints: BoxConstraints(ma),
              child: RegisterForm(tabController: tabController),
            ),
          ],
          //     ),
          //   ),
        ),
      ),
    );
  }
}
