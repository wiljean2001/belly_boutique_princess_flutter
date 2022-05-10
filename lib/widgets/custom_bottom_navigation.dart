import '/blocs/home/home_page_bloc.dart';
import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageBloc = context.read<HomePageBloc>();
    final List<Widget> items = <Widget>[
      Column(
          mainAxisSize: MainAxisSize.min,
          children: const [Icon(Icons.account_circle, size: 30)]),
      Column(
          mainAxisSize: MainAxisSize.min,
          children: const [Icon(Icons.home, size: 30)]),
      Column(
          mainAxisSize: MainAxisSize.min,
          children: const [Icon(Icons.shopping_cart, size: 30)]),
    ];

    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is BottomNavigationInitial) {
          return Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
            child: CurvedNavigationBar(
              index: state.indexBottomNav,
              height: 65,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 400),
              color: Theme.of(context).primaryColor,
              items: items,
              onTap: (index) =>
                  homePageBloc.add(HomeTabChangeEvent(newIndex: index)),
            ),
          );
        }
        return const Text("Error");
      },
    );
  }
}
