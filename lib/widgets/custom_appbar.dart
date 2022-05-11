import 'package:belly_boutique_princess/blocs/home/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../generated/l10n.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool hasActions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.hasActions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image(
            image: AssetImage(S.of(context).logo_home),
            width: 55,
          ),
          Text(
            title,
          ),
        ],
      ),
      actions: hasActions
          ? [
              IconButton(
                tooltip: S.of(context).tooltip_bttn_shopping_card,
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                    if (state is RoleUserLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is RoleUserLoaded) {
                      print('State: ${state.user.role}');
                      return IconButton(
                        tooltip: S.of(context).tooltip_bttn_shopping_card,
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {},
                      );
                    }
                    return const Icon(Icons.error);
                  },
                ),
              // BlocBuilder<ProfileBloc, ProfileState>(
              //   builder: (context, state) {
              //     if (state is ProfileLoading) {
              //       return const CircularProgressIndicator();
              //     }
              //     if (state is ProfileLoaded) {
              //       print('State: ${state.user.role}');
              //       return IconButton(
              //         tooltip: S.of(context).tooltip_bttn_shopping_card,
              //         icon: const Icon(Icons.shopping_cart),
              //         onPressed: () {},
              //       );
              //     }
              //     return const Icon(Icons.error);
              //   },
              // ),
              // PopupMenuButton<String>(
              //   tooltip: S.of(context).tooltip_bttn_options,
              //   onSelected: (index) {
              //     // Visitanos
              //     if (index == S.of(context).menu_appbar_item1) {
              //       Fluttertoast.showToast(
              //           msg: "Tab a visitanos",
              //           toastLength: Toast.LENGTH_SHORT,
              //           gravity: ToastGravity.BOTTOM,
              //           timeInSecForIosWeb: 1,
              //           backgroundColor: Colors.grey,
              //           textColor: Colors.white,
              //           fontSize: 16.0);
              //     }
              //     // setting screen
              //     if (index == S.of(context).menu_appbar_item2) {
              //       Navigator.pushNamed(context, SettingScreen.routeName);
              //     }
              //     // Ayuda
              //     if (index == S.of(context).menu_appbar_item3) {
              //       Fluttertoast.showToast(
              //           msg: "Tap a ayuda",
              //           toastLength: Toast.LENGTH_SHORT,
              //           gravity: ToastGravity.BOTTOM,
              //           timeInSecForIosWeb: 1,
              //           backgroundColor: Colors.grey,
              //           textColor: Colors.white,
              //           fontSize: 16.0);
              //     }
              //     // SignOut session
              //     if (index == S.of(context).menu_appbar_item4) {
              //       RepositoryProvider.of<AuthRepository>(context).signOut();
              //       context.read<AuthBloc>().add(const AuthUserChanged(user: null));
              //       Navigator.pushNamedAndRemoveUntil(
              //           context, '/', (route) => false);
              //     }
              //   },
              //   itemBuilder: (BuildContext context) {
              //     return itemsAppbar.map(
              //       (String choice) {
              //         return PopupMenuItem<String>(
              //           value: choice,
              //           child: Text(choice),
              //         );
              //       },
              //     ).toList();
              //   },
              // ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
