// ignore_for_file: deprecated_member_use

import 'package:auto_size_text/auto_size_text.dart';
import 'package:belly_boutique_princess/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../blocs/blocs.dart';
import '../generated/l10n.dart';
import '../repositories/auth/auth_repository.dart';
import '../screens/setting_screen.dart';

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
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProfileLoaded) {
          return getProfileLoaded(edad: edad, usuario: usuario);
        }
        return Center(child: Text(S.of(context).error_desc));
      },
    );
  }
}

class getProfileLoaded extends StatelessWidget {
  const getProfileLoaded({
    Key? key,
    required this.edad,
    required this.usuario,
  }) : super(key: key);

  final int edad;
  final User usuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: S.of(context).AppTitle, hasActions: false),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            // backgroundColor: Colors.transparent,
            floating: true,
            // brightness: ,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                '@${state.user.name}',
                style: const TextStyle(fontSize: 16),
              ),
              // collapseMode: CollapseMode.none,
              background: Container(
                // margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      state.user.imageUrls[0],
                      // fit: BoxFit.fill,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: CircleAvatar(
                //   foregroundImage: NetworkImage(
                //     state.user.imageUrls[0],
                //     // fit: BoxFit.fill,
                //   ),
                // ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 85,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'Edad',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryColorLight),
                            ),
                            Text(
                              edad.toString(),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryColorLight),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Sexo",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryColorLight),
                            ),
                            Text(
                              usuario.gender,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryColorLight),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Body(),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
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
                RepositoryProvider.of<AuthRepository>(context).signOut();
                context.read<AuthBloc>().add(const AuthUserChanged(user: null));
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
    );
  }
}

// class Header extends StatelessWidget {
//   final User usuario;
//   final double height;

//   const Header({
//     Key? key,
//     required this.usuario,
//     this.height = 190,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final edad = DateTime.now().year - usuario.dateOfBirth!.toDate().year;
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           height: height,
//           padding: const EdgeInsets.only(bottom: 10),
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("graphics/images/fondo_user.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               // UserPhoto(usuario: usuario, size: 120),
//               Expanded(
//                 child: Text(
//                   "@" + (usuario.name), //nombre de usuario
//                   style: TextStyle(
//                       fontSize: 25, color: Theme.of(context).primaryColorLight),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           color: Colors.pink,
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   const Text(
//                     'Edad',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   Text(
//                     edad.toString(),
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   const Text(
//                     "Sexo",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   Text(usuario.gender,
//                       style: const TextStyle(color: Colors.white)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class UserPhoto extends StatelessWidget {
//   final double size;
//   final User usuario;

//   const UserPhoto({
//     Key? key,
//     required this.usuario,
//     this.size = 120,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       child: ,
//     );
//   }

// }
// decoration: BoxDecoration(
//         image: DecorationImage(
//           image: FadeInImage(
//                   image: NetworkImage(usuario.imageUrls[0]),
//                   placeholder:
//                       const AssetImage('graphics/images/loading_gif.gif'))
//               .placeholder,
//         ),
//         //image: const DecorationImage(
//         //image: AssetImage("graphics/images/user.jpg"),
//         //fit: BoxFit.cover,
//         // ),
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: Colors.white,
//           width: 4,
//         ),
//       ),