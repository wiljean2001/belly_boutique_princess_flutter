import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/views/home_view.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  // final User user;
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  // Seteo del bottom navigation opcions del sistema operativo
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.pink,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.pink,
  );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    return const HomeView();
  }
}
