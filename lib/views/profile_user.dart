import 'package:belly_boutique_princess/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

// falta cambiar los textos a dinamicos

class _UserProfilePageState extends State<UserProfileView> {
  final User usuario = User.users.last;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Header(
              usuario: usuario,
              height: 190,
            ),
            Container(
              color: Colors.blueAccent,
              height: 500,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('Edad'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Sexo",
                      ),
                    ],
                  ),
                  /*Column(
                    children: <Widget>[
                      Text(
                        usuario.age.toString(),
                        style: themedark()
                            .textTheme
                            .headline3
                            ?.copyWith(color: Colors.black),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            usuario.gender,
                            style: themedark()
                                .textTheme
                                .headline3
                                ?.copyWith(color: Colors.black),
                          ),
                        ],
                      ),*/
                ],
              ),
            ),
          ],
        ),
        //],
      ),
      //),
    );
  }
}

class Header extends StatelessWidget {
  final User usuario;
  final double height;

  const Header({
    Key? key,
    required this.usuario,
    this.height = 190,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("graphics/images/fondo_user.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          UserPhoto(usuario: usuario, size: 120),
          Text(
            "@" + (usuario.name), //nombre de usuario
          ),
        ],
      ),
    );
  }
}

class UserPhoto extends StatelessWidget {
  final double size;
  final User usuario;

  const UserPhoto({
    Key? key,
    required this.usuario,
    this.size = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(usuario.imageUrls[0]),
        ),
        //image: const DecorationImage(
        //image: AssetImage("graphics/images/user.jpg"),
        //fit: BoxFit.cover,
        // ),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
      ),
    );
  }
}
