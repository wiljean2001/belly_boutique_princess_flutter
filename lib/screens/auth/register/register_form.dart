import '../../../utils/validators.dart';
import '/cubit/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/onboarding/onboarding_bloc.dart';
import '../../../models/models.dart';
import '../../../widgets/custom_button_gradiant.dart';

class RegisterForm extends StatelessWidget {
  final TabController tabController;

  const RegisterForm({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _contextRegister = context.read<SignupCubit>();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<SignupCubit, SignupState>(
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
                    validator: (email) => !Validators.isValidEmail(email!)
                        ? 'Correo no valido'
                        : 'Correo valido',
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
                    validator: (pass) => !Validators.isValidPassword(pass!)
                        ? 'Contraseña no valida'
                        : 'Contraseña valida',
                    onChanged: (text) {
                      _contextRegister.passwordChanged(text);
                      print(state.password);
                    },
                  ),
                  // const SizedBox(height: 10),
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
                      if (!_formKey.currentState!.validate()) {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) => const AlertDialog(
                            title: Text('Error de registro'),
                            content: Text("Al menos 8 caracteres"
                                "Contiene al menos un dígito Contiene al menos un carácter alfa inferior y un carácter alfa superior"
                                "Contiene al menos un carácter dentro de un conjunto de caracteres especiales"
                                "No contiene espacio, tabulador, etc."),
                          ),
                        );

                        return;
                      } else if (_contextRegister.state.isFormValid) {
                        await _contextRegister.signUpWithCredentials();
                        print(_contextRegister.state);
                        try {
                          User user = User(
                            // created a empty user
                            id: _contextRegister.state.user!.uid,
                            name: '',
                            age: 0,
                            gender: '',
                            imageUrls: const [],
                            // jobTitle: '',
                            interests: const [],
                            // bio: '',
                            location: '',
                          );
                          context.read<OnboardingBloc>().add(
                                StartOnboarding(
                                  user: user,
                                ),
                              );
                          tabController.animateTo(tabController.index + 1);
                        } catch (e) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                const AlertDialog(
                              title: Text('Error de registro'),
                              content: Text("Al menos 8 caracteres"
                                  "Contiene al menos un dígito Contiene al menos un carácter alfa inferior y un carácter alfa superior"
                                  "Contiene al menos un carácter dentro de un conjunto de caracteres especiales"
                                  "No contiene espacio, tabulador, etc."),
                            ),
                          );
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => const AlertDialog(
                            title: Text('Error de registro'),
                            content: Text("Al menos 8 caracteres"
                                "Contiene al menos un dígito Contiene al menos un carácter alfa inferior y un carácter alfa superior"
                                "Contiene al menos un carácter dentro de un conjunto de caracteres especiales"
                                "No contiene espacio, tabulador, etc."),
                          ),
                        );
                      }
                    },
                  ),
                  // const SizedBox(height: 10),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
