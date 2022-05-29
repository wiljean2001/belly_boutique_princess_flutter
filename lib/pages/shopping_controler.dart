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
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _cardProducto(),
            Card(
              elevation: 5,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: <Widget>[
                    Image.network(
                      "https://i.ebayimg.com/images/g/-ioAAOSw5Ulg-34h/s-l500.jpg",
                    ),
                    Text(
                      "Rei Chiquita",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            /*Card(
              elevation: 5,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: <Widget>[
                    Image.network(
                      "https://i.ebayimg.com/images/g/-ioAAOSw5Ulg-34h/s-l500.jpg",
                    ),
                    Text(
                      "Rei Chiquita",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),*/
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 5,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: <Widget>[
                    Image.network(
                      "https://i.ebayimg.com/images/g/-ioAAOSw5Ulg-34h/s-l500.jpg",
                    ),
                    Text(
                      "Rei Chiquita",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _cardProducto extends StatelessWidget {
  const _cardProducto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: <Widget>[
            Image.network(
              "https://i.ebayimg.com/images/g/-ioAAOSw5Ulg-34h/s-l500.jpg",
            ),
            Text(
              "Rei Chiquita",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
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
