import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '/widgets/curved_widget.dart';

import 'register_form.dart';

class RegisterScreen extends StatelessWidget {
  final TabController tabController;
  const RegisterScreen({Key? key, required this.tabController})
      : super(key: key);

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
              //curved widget with logo
              chield: Container(
                padding: const EdgeInsets.only(left: 50, top: 100),
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
                height: 300,
                child: Text(S.of(context).title_register,
                    style: Theme.of(context).textTheme.headline2),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 300),
              height: 300,
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
