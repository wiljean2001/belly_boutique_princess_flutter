// ignore_for_file: deprecated_member_use

import 'package:belly_boutique_princess/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../blocs/blocs.dart';
import '../generated/l10n.dart';
import '../repositories/auth/auth_repository.dart';
import '../screens/setting_screen.dart';
import '../widgets/custom_appbar.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfileView> {
  final User usuario = User.users.last;

  @override
  Widget build(BuildContext context) {
    final edad = DateTime.now().year - usuario.dateOfBirth!.toDate().year;
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).AppTitle, hasActions: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Header(
              usuario: usuario,
              height: 190,
            ),
            Container(
              color: Colors.pink,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text(
                        'Edad',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        edad.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        "Sexo",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(usuario.gender,
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: MaterialButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Tab a visitanos",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      child: const Text(
                        'Visitanos',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ),
                ),
                const Divider(height: 20, thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SettingScreen.routeName);
                      },
                      child: const Text(
                        'Configuraciones',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ),
                ),
                const Divider(height: 20, thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: MaterialButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Tap a ayuda",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      child: const Text(
                        'Ayuda',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ),
                ),
                const Divider(height: 20, thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: MaterialButton(
                      onPressed: () {
                        RepositoryProvider.of<AuthRepository>(context)
                            .signOut();
                        context
                            .read<AuthBloc>()
                            .add(const AuthUserChanged(user: null));
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (route) => false);
                      },
                      child: const Text(
                        'Cerrar Sesion',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
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
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(color: Colors.white),
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
