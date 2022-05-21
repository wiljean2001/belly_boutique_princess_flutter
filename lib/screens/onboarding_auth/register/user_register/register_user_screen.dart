import 'package:belly_boutique_princess/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../../widgets/curved_widget.dart';
import 'register_user_form.dart';

class RegisterUserScreen extends StatelessWidget {
  final TabController tabController;

  const RegisterUserScreen({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              physics: const BouncingScrollPhysics(),
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
                      child: Text(
                        S.of(context).title_user_screen,
                        style: Theme.of(context).textTheme.headline2
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 220),
                    height: 280,
                    child: RegisterUserForm(tabController: tabController),
                  ),
                ],
                //     ),
                //   ),
              ),
            ),
          );
        } else {
          return Text(S.of(context).error_desc);
        }
      },
    );
  }
}
