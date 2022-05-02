import 'package:flutter/material.dart';

// import 'widgets.dart';
import '../screens/auth/auth_screens.dart';
import 'curved_widget.dart';

class OnboardingScreen extends StatelessWidget {
  static const List<Tab> tabs = <Tab>[
    // Tab(text: 'Start'),
    Tab(text: 'Login'),
    Tab(text: 'Register'),
    Tab(text: 'User'),
    // Tab(text: 'Ending')
  ];

  const OnboardingScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const OnboardingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        return Scaffold(
          // extendBodyBehindAppBar: true,
          // appBar: AppBar(
          //   iconTheme: const IconThemeData(color: Colors.black),
          //   elevation: 0,
          //   backgroundColor: Colors.transparent,
          // ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(225, 242, 203, 208),
                  Color(0xfff4ced9),
                ],
              ),
            ),
            height: double.infinity,
            // child: SingleChildScrollView(
            child: TabBarView(
              children: [
                LoginScreen(tabController: tabController),
                RegisterScreen(tabController: tabController),
                RegisterUserScreen(tabController: tabController),
              ],
            ),
            // ),
          ),
        );
      }),
    );
  }
}
