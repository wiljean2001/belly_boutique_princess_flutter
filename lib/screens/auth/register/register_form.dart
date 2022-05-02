import '/cubit/signup/signup_cubit.dart';
import '/screens/auth/register/user_register/register_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../blocs/onboarding/onboarding_bloc.dart';
import '../../../models/models.dart';
import '../../../widgets/custom_button_gradiant.dart';

class RegisterForm extends StatelessWidget {
  final TabController tabController;
  const RegisterForm({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _contextRegister = context.read<SignupCubit>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //campo formulario CORREO
              TextFormField(
                restorationId: 'txt_email_user',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  // border: OutlineInputBorder(),
                  labelText: 'Correo electrónico',
                  icon: Icon(Icons.email),
                ),
                autocorrect: true,
                onChanged: (text) {
                  _contextRegister.emailChanged(text);
                  print(state.email);
                },
              ),
              //campo formulario CONTRASENA
              TextFormField(
                restorationId: 'txt_pass_user',
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: const InputDecoration(
                  // border: OutlineInputBorder(),
                  labelText: 'Constraseña',
                  icon: Icon(Icons.lock),
                ),
                autocorrect: true,
                onChanged: (text) {
                  _contextRegister.passwordChanged(text);
                  print(state.password);
                },
              ),
              const SizedBox(height: 10),
              CustomButtonGradiant(
                height: 45,
                width: 150,
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                text: const Text(
                  'Registrarse',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  await _contextRegister.signUpWithCredentials();
                  print(_contextRegister.state.isFormValid);
                  print(_contextRegister.state.email);
                  print(_contextRegister.state.password);

                  User user = User(
                    // error campos vacios
                    id: _contextRegister.state.user!.uid,
                    name: '',
                    age: 0,
                    gender: '',
                    imageUrls: [],
                    // jobTitle: '',
                    interests: [],
                    // bio: '',
                    location: '',
                  );

                  context.read<OnboardingBloc>().add(
                        StartOnboarding(
                          user: user,
                        ),
                      );
                  tabController.animateTo(tabController.index + 1);
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const RegisterUserScreen(),
                  //   ),
                  // );
                },
              ),
              const SizedBox(height: 10),
              CustomButtonGradiant(
                //BUtton Registrar
                height: 45,
                width: 150,
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                text: const Text(
                  'Regresar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  tabController.animateTo(tabController.index - 1);
                  // Navigator.push(context, MaterialPageRoute(builder: (_) {
                  //   return const RegisterScreen();
                  // }));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
