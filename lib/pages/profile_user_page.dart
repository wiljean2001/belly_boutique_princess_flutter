import 'package:belly_boutique_princess/utils/open_all.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

import '../repositories/auth/auth_repository.dart';
import '../screens/setting_screen.dart';
import 'package:belly_boutique_princess/models/user_model.dart';

import 'pruebaAnimate.dart';

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
                onPressed: () async => await showDialog(
                  context: context,
                  // barrierColor: Colors.transparent,
                  useRootNavigator: true,
                  builder: (BuildContext context) => const AlertDialog(
                    contentPadding: EdgeInsets.all(0),
                    alignment: Alignment.center,
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
                  Navigator.pushNamed(
                      context, OpenContainerTransformDemo.routeName);
                  // Fluttertoast.showToast(
                  // msg: "Tap a ayuda",
                  // toastLength: Toast.LENGTH_SHORT,
                  // gravity: ToastGravity.BOTTOM,
                  // timeInSecForIosWeb: 1,
                  // backgroundColor: Colors.grey,
                  // textColor: Colors.white,
                  // fontSize: 16.0);
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
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CardVisit(
          backgroundColor: Theme.of(context).primaryColorLight,
          title: 'Facebook',
          descript: 'Visítanos en Facebook dandole click al botón',
          icon: const Icon(Icons.facebook),
          image: 'graphics/images/facebook_64.png',
          urlWeb: 'https://www.facebook.com/belyboutiqueprincess',
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CardVisit(
          backgroundColor: Theme.of(context).primaryColor,
          title: 'Whatsapp',
          descript: 'Visítanos en Whatsapp dandole click al botón',
          icon: const Icon(Icons.whatsapp),
          image: 'graphics/images/whatsapp_64.png',
          whatsapp: "+51953433761",
          whatsappMessage: "Hola",
        ),
      ),
    ];

    return SizedBox(
      width: 200,
      height: 250,
      child: PageView(
        physics: const BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 0.8),
        children: cardPages,
      ),
    );
  }
}

class CardVisit extends StatelessWidget {
  final String title;
  final String? descript;
  final Icon? icon;
  final String? image;
  final Color? backgroundColor;
  final String? urlWeb;
  final String? whatsapp;
  final String? whatsappMessage;

  // final Function onPressed;

  const CardVisit({
    Key? key,
    required this.title,
    this.descript,
    this.icon,
    this.backgroundColor = Colors.red,
    this.image,
    this.urlWeb,
    this.whatsapp,
    this.whatsappMessage,

    // required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            backgroundColor!,
            Colors.white,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            descript != null
                ? Text(
                    descript!,
                    textAlign: TextAlign.center,
                  )
                : const Text(''),
            // icon != null ? icon! : const Text(''),
            const SizedBox(height: 10),
            image != null
                ? MaterialButton(
                    onPressed: () {
                      if (urlWeb != null) {
                        OpenAll.openUrl(
                          urlWeb:
                              'https://www.facebook.com/belyboutiqueprincess',
                        );
                      } else if (whatsapp != null && whatsappMessage != null) {
                        OpenAll.openwhatsapp(
                          whatsapp: whatsapp!,
                          message: whatsappMessage!,
                        );
                      }
                    },
                    child: Image(
                      image: AssetImage(image!),
                    ),
                  )
                : const Text(''),
          ],
        ),
      ),
    );
  }
}
