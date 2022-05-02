import '/cubit/signup/signup_cubit.dart';
import '/screens/home_screen.dart';
import '/screens/auth/register/user_register/register_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/custom_button_gradiant.dart';

class RegisterUserForm extends StatefulWidget {
  const RegisterUserForm({Key? key}) : super(key: key);

  @override
  State<RegisterUserForm> createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<RegisterUserForm> {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  final _date18years = DateTime.now().year - 18;
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Sexo';

    Future<void> _showDatePicker() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime((DateTime.now().year - 18)),
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year - 18),
        // (2101)
      );
      if (picked != null) {
        print(DateFormat("yyyy-MM-dd").format(picked));
      }
    }

    final _contextRegister = context.read<SignupCubit>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //campo formulario NOMBRE
              TextFormField(
                restorationId: 'txt_name_user',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  // border: OutlineInputBorder(),
                  labelText: 'Usuario',
                  icon: Icon(Icons.person),
                ),
                autocorrect: true,
              ),
              const SizedBox(height: 10),
              // Genero
              SizedBox(
                width: 300,
                height: 55,
                child: DropdownButton<String>(
                  isExpanded: true,
                  focusColor: Colors.pink,
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 45,
                  ),
                  elevation: 16,
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 18),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  underline: Container(
                    height: 2,
                    color: Colors.black12,
                  ),

                  // cambiar por tipo Categorias
                  items: <String>['Sexo', 'Masculino', 'Femenino']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    },
                  ).toList(),
                  onChanged: (String? index) {
                    setState(
                      () {
                        dropdownValue = index!;
                      },
                    );
                  },
                ),
              ),

              // falta seccion de

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Icon(Icons.date_range),
                  ),
                  Expanded(
                    flex: 3,
                    child: MaterialButton(
                      elevation: 10,
                      child: const Text('Seleccionar fecha de nacimiento'),
                      onPressed: _showDatePicker,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(width: 25),
                ],
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomeScreen();
                      },
                    ),
                    (route) => false,
                  );
                  // return const RegisterUserScreen();
                  // await _contextRegister.signUpWithCredentials();
                  // User user = User(
                  //   id: _contextRegister.state.user!.uid,
                  //   name: '',
                  //   age: 0,
                  //   gender: '',
                  //   imageUrls: [],
                  //   // jobTitle: '',
                  //   interests: [],
                  //   // bio: '',
                  //   location: '',
                  // );
                  // context.read<OnboardingBloc>().add(
                  //       StartOnboarding(
                  //         user: user,
                  //       ),
                  //     );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
