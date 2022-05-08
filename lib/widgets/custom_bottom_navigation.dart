import '/blocs/home/home_page_bloc.dart';
import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final homePageBloc = context.read<HomePageBloc>();

    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is BottomNavigationInitial) {
          return Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
            child: CurvedNavigationBar(
              index: state.indexBottomNav,
              height: 60,
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
