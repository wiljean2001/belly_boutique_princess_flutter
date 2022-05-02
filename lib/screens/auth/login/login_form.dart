import '/cubit/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/custom_button_gradiant.dart';
import '../register/register_screen.dart';

class LoginForm extends StatelessWidget {
  final TabController tabController;
  const LoginForm({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _contextSignUp = context.read<SignupCubit>();
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                // controller: _emailController,
                restorationId: 'txt_email_user',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  // border: OutlineInputBorder(),
                  labelText: 'Correo electrónico',
                  icon: Icon(Icons.email),
                ),
                autocorrect: true,
                onChanged: (value) {
                  _contextSignUp.emailChanged(value);
                  print("Pass> " + state.email);
                },
              ),
              TextFormField(
                // controller: _passwordController,
                restorationId: 'txt_pass_user',
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: const InputDecoration(
                  // border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                  icon: Icon(Icons.lock),
                ),
                autocorrect: true,
                onChanged: (value) {
                  _contextSignUp.passwordChanged(value);
                  print("Pass> " + state.password);
                },
              ),
              const SizedBox(height: 10),
              CustomButtonGradiant(
                height: 45,
                icon: const Icon(Icons.check, color: Colors.white),
                text: const Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
                width: 150,
              ),
              const SizedBox(height: 10),
              CustomButtonGradiant(
                //BUtton Registrar
                height: 45,
                width: 150,
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                text: const Text(
                  'Registrarse',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  tabController.animateTo(tabController.index + 1);
                  // Navigator.push(context, MaterialPageRoute(builder: (_) {
                  //   return const RegisterScreen();
                  // }));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
