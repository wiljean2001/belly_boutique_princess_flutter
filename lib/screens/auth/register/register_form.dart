import '../../../blocs/blocs.dart';
import '../../../generated/l10n.dart';
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
            height: MediaQuery.of(context).size.height/1.6,
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
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: S.of(context).email,
                      icon: const Icon(Icons.email),
                    ),
                    validator: (email) => !Validators.isValidEmail(email!)
                        ? S.of(context).validator_email_error
                        : null,
                    onChanged: (text) {
                      _contextRegister.emailChanged(text);
                    },
                  ),
                  //campo formulario CONTRASENA
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: S.of(context).password,
                      icon: const Icon(Icons.lock),
                    ),
                    validator: (pass) =>
                        Validators.ispasswordValidator(pass!, context),
                    onChanged: (text) {
                      _contextRegister.passwordChanged(text);
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
                    text: Text(
                      S.of(context).bttn_register,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      // validator form
                      if (!_formKeyReg.currentState!.validate()) {
                        return;
                      }

                      // SignUp
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
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(S.of(context).register_error_title),
                            content: Text(S.of(context).register_error_desc),
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
                  const Divider(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () =>
                            tabController.animateTo(tabController.index - 1),
                        child: Text(S.of(context).bttn_go_back),
                      ),
                    ],
                  ),
                  // CustomButtonGradiant(
                  //   //BUtton Registrar
                  //   height: 45,
                  //   width: 150,
                  //   icon: const Icon(Icons.arrow_back, color: Colors.white),
                  //   text: Text(
                  //     S.of(context).bttn_go_back,
                  //     style: const TextStyle(color: Colors.white),
                  //   ),
                  //   onPressed: () {
                  //     tabController.animateTo(tabController.index - 1);
                  //   },
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
