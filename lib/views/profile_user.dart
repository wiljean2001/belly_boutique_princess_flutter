import 'package:belly_boutique_princess/config/theme_dark.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hola",
              style: themedark()
                  .textTheme
                  .headline3
                  ?.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
