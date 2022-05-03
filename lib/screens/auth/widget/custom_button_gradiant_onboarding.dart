import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../../../cubit/cubits.dart';

class CustomButtonGradiantOnboarding extends StatelessWidget {
  final TabController tabController;
  final double width, height;
  final Function? onPressed;
  final Icon icon;
  final Text text;

  const CustomButtonGradiantOnboarding({
    Key? key,
    required this.width,
    required this.height,
    this.onPressed,
    required this.icon,
    required this.text,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _contextSignUp = context.read<SignupCubit>(); // reference
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xffffae88), Color(0xff8f93ea)],
        ),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        onPressed: onPressed == null
            ? () async {
          // login screen
          print(tabController.index);
          if (tabController.index == 0) {
            print(_contextSignUp.state);
            print(_contextSignUp.state.email);
            print(_contextSignUp.state.password);
            await _contextSignUp.signUpWithCredentials();

            // print("User:->>>>>>>");
            // print(context.read<AuthRepository>());
            // print(context.read<AuthRepository>().);

            context
                .read<AuthBloc>()
                .add(AuthUserChanged(user: _contextSignUp.state.user));

            print(context
                .read<AuthBloc>()
                .state);

            Navigator.pushNamed(context, '/');
          }
          if (tabController.index == 1) {
            print("tab 2 / register");
          } else {
            print("tab +1");
          }

          if (tabController.index == 2) {
            print("tab '/'");
          }
        }
            : onPressed!(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            text,
            icon,
          ],
        ),
      ),
    );
  }
}
