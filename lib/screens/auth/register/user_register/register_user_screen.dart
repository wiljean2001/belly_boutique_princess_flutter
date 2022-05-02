import 'package:belly_boutique_princess/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/curved_widget.dart';
import 'register_user_form.dart';

class RegisterUserScreen extends StatefulWidget {
  final TabController tabController;
  const RegisterUserScreen({Key? key, required this.tabController})
      : super(key: key);

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   appBar: AppBar(
    //     iconTheme: const IconThemeData(color: Colors.black),
    //     elevation: 0,
    //     backgroundColor: Colors.transparent,
    //   ),
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OnboardingLoaded) {
          return Container(
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
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  CurvedWidget(
                    mode: 0,
                    curvedDistance: 250,
                    curvedHeight: 100,
                    //curved widget with logo
                    chield: Container(
                      padding: const EdgeInsets.only(left: 50, top: 100),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.white.withOpacity(0.5),
                            ]),
                      ),
                      width: double.infinity,
                      height: 300,
                      child: const Text("Usuario",
                          style: TextStyle(color: Colors.black, fontSize: 40)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 220),
                    // constraints: BoxConstraints(ma),
                    child: const RegisterUserForm(),
                  ),
                ],
                //     ),
                //   ),
              ),
            ),
          );
        } else {
          return const Text('Algo salió mal.');
        }
      },
    );
  }
}
