import 'package:belly_boutique_princess/screens/onboarding_auth/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../generated/l10n.dart';
import '../../widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'admin_screens.dart';

class MenuAdmintration extends StatelessWidget {
  static const String routeName = '/admin'; //route
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          // print the status user with the authbloc
          print(BlocProvider.of<AuthBloc>(context).state.status);

          return BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.unauthenticated
              ? const OnboardingScreen()
              : const MenuAdmintration();
        });
  }

  const MenuAdmintration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: S.of(context).title_admin_screen,
          hasActions: false,
          hasIcon: false),
      body: const CustomOptions(),
    );
  }
}

class CustomOptions extends StatelessWidget {
  const CustomOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<OptionAdmin> listOptions = [
      OptionAdmin(
        title: 'AGREGAR PRODUCTO',
        icon: Icons.add_chart_outlined,
        onPressed: () =>
            Navigator.of(context).pushNamed(CreateProductScreen.routeName),
      ),
      OptionAdmin(
        title: 'EDITAR PRODUCTO',
        icon: Icons.edit_outlined,
        onPressed: () {},
      ),
      OptionAdmin(
          title: 'VER PRODUCTOS',
          icon: Icons.view_module_outlined,
          onPressed: () {}),
      OptionAdmin(
        title: 'AGREGAR CATEGORÍA',
        icon: Icons.add_comment_outlined,
        onPressed: () {},
      ),
      OptionAdmin(
        title: 'EDITAR CATEGORÍA',
        icon: Icons.edit_note_outlined,
        onPressed: () {},
      ),
      OptionAdmin(
        title: 'VER CATEGORÍAS',
        icon: Icons.view_agenda_outlined,
        onPressed: () {},
      ),
    ];
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, i) {
            return Card(
              elevation: 8,
              surfaceTintColor: Theme.of(context).primaryColorLight,
              margin: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () => listOptions[i].onPressed(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      listOptions[i].icon,
                      size: 85,
                    ),
                    Text(
                      listOptions[i].title,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }, childCount: listOptions.length),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
        ),
      ],
    );
  }
}

class OptionAdmin {
  String title;
  IconData icon;
  Function onPressed;
  OptionAdmin({
    required this.title,
    required this.icon,
    required this.onPressed,
  });
}
/**
 * InteractiveViewer(
          boundaryMargin: EdgeInsets.all(20.0),
          minScale: 0.1,
          maxScale: 1.6,
          child: Image(image: AssetImage("graphics/images/Bestido 1_n.jpg")),
        ),
 *
 */
