import 'package:flutter/material.dart';

class shopping_controller extends StatelessWidget {
  shopping_controller({Key? key}) : super(key: key);
  List<Widget> pages = [
    pageTeGustara(),
    pageTeGustara2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: pages,
      ),
    );
  }
}

class pageTeGustara extends StatelessWidget {
  const pageTeGustara({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 500,
          color: Colors.amber,
        ),
      ],
    );
  }
}

class pageTeGustara2 extends StatelessWidget {
  const pageTeGustara2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 500,
          color: Colors.red,
        ),
      ],
    );
  }
}
