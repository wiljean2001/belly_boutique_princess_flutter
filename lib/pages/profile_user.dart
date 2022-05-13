// ignore_for_file: deprecated_member_use

import 'package:auto_size_text/auto_size_text.dart';
import 'package:belly_boutique_princess/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

import '../blocs/blocs.dart';
import '../blocs/theme.dart';
import '../generated/l10n.dart';
import '../repositories/auth/auth_repository.dart';
import '../screens/setting_screen.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProfileLoaded) {
          final edad =
              DateTime.now().year - state.user.dateOfBirth!.toDate().year;
          return getProfileLoaded(edad: edad, usuario: state.user);
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
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                '@${usuario.name}',
                style: TextStyle(
                  fontSize: 16,
                  shadows: [
                    Shadow(
                        color: Theme.of(context).primaryColorDark,
                        blurRadius: 10)
                  ],
                ),
              ),
              // collapseMode: CollapseMode.none,
              background: PinchZoom(
                // onTap: () {
                //   Fluttertoast.showToast(
                //       msg: "Agrandar la imagen",
                //       toastLength: Toast.LENGTH_SHORT,
                //       gravity: ToastGravity.BOTTOM,
                //       timeInSecForIosWeb: 1,
                //       backgroundColor: Colors.grey,
                //       textColor: Colors.white,
                //       fontSize: 16.0);
                // },
                child: Container(
                  // margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        usuario.imageUrls[0],
                        // fit: BoxFit.fill,
                      ),
                      alignment: Alignment.center,
                      fit: BoxFit.fitWidth,
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
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            fillOverscroll: true,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    // width: double.infinity,
                    height: 80,
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
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              Text(
                                edad.toString(),
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Sexo",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              Text(
                                usuario.gender,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight),
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
            ),
          ),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: MaterialButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: PagesVisit(),
                    backgroundColor: Colors.transparent,
                    // actions: <Widget>[
                    //   TextButton(
                    //     onPressed: () => Navigator.pop(context, 'Cancel'),
                    //     child: const Text('Cancel'),
                    //   ),
                    //   TextButton(
                    //     onPressed: () => Navigator.pop(context, 'OK'),
                    //     child: const Text('OK'),
                    //   ),
                    // ],
                  ),
                ),
                // Fluttertoast.showToast(
                //     msg: "Tab a visitanos",
                //     toastLength: Toast.LENGTH_SHORT,
                //     gravity: ToastGravity.BOTTOM,
                //     timeInSecForIosWeb: 1,
                //     backgroundColor: Colors.grey,
                //     textColor: Colors.white,
                //     fontSize: 16.0);

                child: const Text(
                  'Visitanos',
                  style: TextStyle(color: Colors.pink),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
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
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
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
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: MaterialButton(
                onPressed: () {
                  RepositoryProvider.of<AuthRepository>(context).signOut();
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
        ),
      ],
    );
  }
}

class PagesVisit extends StatelessWidget {
  const PagesVisit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> cardPages = [
      const CardVisit(
        backgroundColor: Colors.amber,
        title: 'Facebook',
        descript: 'Visita en Facebook dandole click al botón',
        icon: Icon(Icons.facebook),
      ),
      const CardVisit(
        backgroundColor: Colors.amber,
        title: 'Whatsapp',
        descript: 'Visita en Whatsapp dandole click al botón',
        icon: Icon(Icons.whatsapp),
      ),
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Center(
        child: PageView(
          children: cardPages,
        ),
      ),
    );
  }
}

class CardVisit extends StatelessWidget {
  final String title;
  final String? descript;
  final Icon? icon;
  final Image? image;
  final Color? backgroundColor;

  const CardVisit(
      {Key? key,
      required this.title,
      this.descript,
      this.icon,
      this.backgroundColor = Colors.red,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            descript != null ? Text(descript!, style: TextStyle(),) : const Text(''),
            icon != null ? icon! : const Text(''),
            image != null
                ? Container(
                    width: 200,
                    child: image!,
                  )
                : const Text(''),
          ],
        ),
      ),
    );
  }
}
