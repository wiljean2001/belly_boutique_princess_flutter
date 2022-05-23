import 'package:belly_boutique_princess/screens/admin/menu_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../generated/assets.dart';
import '../generated/l10n.dart';
import '../screens/admin/admin_screens.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool hasActions;
  final bool hasIcon;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.hasActions = true,
    this.hasIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: SizedBox(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                hasIcon
                    ? const Image(
                        image: AssetImage(Assets.imagesLocoCorona),
                        width: 45,
                      )
                    : const SizedBox(),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          Theme.of(context).textTheme.titleLarge?.fontSize),
                  // style: Theme.of(context).textTheme,
                ),
              ],
            ),
          ),
          hasActions
              ? Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8),
                  child: Container(
                    width: AppBar().preferredSize.height - 8,
                    height: AppBar().preferredSize.height - 8,
                    color: Colors.transparent,
                    child: Material(
                      color: Colors.transparent,
                      //tooltip: S.of(context).tooltip_bttn_shopping_card,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(
                            AppBar().preferredSize.height),
                        child: Icon(Icons.search_outlined,
                            color: Theme.of(context).primaryColorLight),
                        onTap: () {},
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
