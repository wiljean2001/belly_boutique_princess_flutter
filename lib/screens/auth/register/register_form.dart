import '../../../blocs/blocs.dart';
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
    final GlobalKey<FormState> _formKeyReg = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          return Container(
            height: 350,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKeyReg,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //campo formulario CORREO
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
                    onChanged: (text) {
                      _contextRegister.emailChanged(text);
                      // print(state.email);
                    },
                  ),
                  //campo formulario CONTRASENA
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: 'Constraseña',
                      icon: Icon(Icons.lock),
                    ),
                    validator: (pass) => Validators.ispasswordValidator(pass!),
                    onChanged: (text) {
                      _contextRegister.passwordChanged(text);
                      // print(state.password);
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
                      print(!_formKeyReg.currentState!.validate());
                      if (!_formKeyReg.currentState!.validate()) {
                        return;
                      }

                      // if (_contextRegister.state.isFormValid) {
                      await _contextRegister.signUpWithCredentials();
                      print(_contextRegister.state);
                      try {
                        User user = User(
                          // created a empty user
                          id: _contextRegister.state.user!.uid,
                          name: '',
                          dateOfBirth: null,
                          gender: '',
                          imageUrls: const [],
                          interests: const [],
                          location: '',
                        );
                        context.read<OnboardingBloc>().add(
                              StartOnboarding(
                                user: user,
                              ),
                            );
                        return tabController.animateTo(tabController.index + 1);
                      } catch (e) {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) => const AlertDialog(
                            title: Text('Error de registro'),
                            content: Text("Usuario existente"),
                          ),
                        );

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                              (route) => false,
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
