import 'package:belly_boutique_princess/config/theme_default.dart';
import 'package:belly_boutique_princess/utils/validators.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/blocs.dart';
import '../../../generated/l10n.dart';
import '/cubit/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/custom_button_gradiant.dart';

class LoginForm extends StatelessWidget {
  final TabController tabController;

  LoginForm({Key? key, required this.tabController}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _contextSignUp = context.read<SignupCubit>();

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Text(
                //   S.of(context).title_sign_in,
                //   style: Theme.of(context).textTheme.headlineLarge,
                // ),
                Text(
                  'Iniciar sesión con una cuenta existente de Bely Boutique',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black.withOpacity(.5)),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: S.of(context).email,
                    icon: const Icon(Icons.email),
                  ),
                  validator: (email) => !Validators.isValidEmail(email!)
                      ? S.of(context).validator_email_error
                      : null,
                  onChanged: (value) {
                    _contextSignUp.emailChanged(value);
                  },
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: S.of(context).password,
                    icon: const Icon(Icons.lock),
                  ),
                  validator: (pass) =>
                      Validators.ispasswordValidator(pass!, context),
                  onChanged: (value) {
                    _contextSignUp.passwordChanged(value);
                  },
                ),
                CustomButtonGradiant(
                  // SignIn
                  height: 45,
                  icon: const Icon(Icons.check, color: Colors.white),
                  text: Text(
                    S.of(context).bttn_login,
                    style: const TextStyle(color: Colors.white),
                  ),
                  width: 150,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    await _contextSignUp.signInWithCredentials().then(
                      (value) {
                        context.read<AuthBloc>().add(
                            AuthUserChanged(user: _contextSignUp.state.user));
                        if (_contextSignUp.state.status ==
                            SignupStatus.success) {
                          // go to home screen
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                        }
                      },
                    ).catchError(
                      (e) async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(S.of(context).error_title),
                            content: Text(S.of(context).error_desc),
                          ),
                        );
                      },
                    );
                  },
                ),
                // const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // CustomButtonGradiant(
                    //   height: 45,
                    //   icon: const Icon(Icons.backspace, color: Colors.white),
                    //   text: Text(
                    //     S.of(context).bttn_go_back,
                    //     style: const TextStyle(color: Colors.white),
                    //   ),
                    //   onPressed: () =>
                    //       tabController.animateTo(tabController.index - 1),
                    //   width: 150,
                    // ),
                    TextButton(
                      onPressed: () =>
                          tabController.animateTo(tabController.index + 1),
                      child: Text(S.of(context).bttn_register),
                    ),
                    //icon:
                    // const Icon(Icons.arrow_forward, color: Colors.white),
                    //  tabController.animateTo(tabController.index + 1),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
