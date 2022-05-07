import 'package:belly_boutique_princess/repositories/repositories.dart';
import 'package:belly_boutique_princess/screens/screens.dart';
import 'package:belly_boutique_princess/utils/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/blocs.dart';
import '../../../blocs/blocs.dart';
import '/cubit/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/custom_button_gradiant.dart';

class LoginForm extends StatelessWidget {
  final TabController tabController;

  const LoginForm({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _contextSignUp = context.read<SignupCubit>();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Container(
          height: 350,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Correo electrónico',
                    icon: Icon(Icons.email),
                  ),
                  validator: (email) => !Validators.isValidEmail(email!)
                      ? 'Correo no valido'
                      : null,
                  onChanged: (value) {
                    _contextSignUp.emailChanged(value);
                    // print("Pass> " + state.email);
                  },
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    icon: Icon(Icons.lock),
                  ),
                  validator: (pass) => Validators.ispasswordValidator(pass!),
                  onChanged: (value) {
                    _contextSignUp.passwordChanged(value);
                    // print("Pass> " + state.password);
                  },
                ),
                // const SizedBox(height: 20),
                CustomButtonGradiant(
                  // SignIn
                  height: 45,
                  icon: const Icon(Icons.check, color: Colors.white),
                  text: const Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.white),
                  ),
                  width: 150,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    await _contextSignUp.signInWithCredentials().then(
                      (value) {
                        print("AL FIN EL USUARIO XD");
                        print(_contextSignUp.state.user);
                        context.read<AuthBloc>().add(
                            AuthUserChanged(user: _contextSignUp.state.user));
                        if (_contextSignUp.state.status ==
                            SignupStatus.success) {
                          print("STATE SUCCESS");
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                        }
                      },
                    ).catchError(
                      (e) async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Error'),
                            content:
                                Text("Correo o contraseña incorrectos: $e"),
                          ),
                        );
                      },
                    );
                  },
                ),
                // const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonGradiant(
                      height: 45,
                      icon: const Icon(Icons.backspace, color: Colors.white),
                      text: const Text(
                        'Regresar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () =>
                          tabController.animateTo(tabController.index - 1),
                      width: 150,
                    ),
                    CustomButtonGradiant(
                      //BUtton Registrar
                      height: 45,
                      width: 150,
                      icon:
                          const Icon(Icons.arrow_forward, color: Colors.white),
                      text: const Text(
                        'Registrarse',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () =>
                          tabController.animateTo(tabController.index + 1),
                    ),
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
