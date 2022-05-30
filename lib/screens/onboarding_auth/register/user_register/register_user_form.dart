import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../blocs/blocs.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/custom_button_gradiant.dart';

class RegisterUserForm extends StatefulWidget {
  final TabController tabController;

  const RegisterUserForm({Key? key, required this.tabController})
      : super(key: key);

  @override
  State<RegisterUserForm> createState() =>
      _RegisterUserFormState(tabController);
}

class _RegisterUserFormState extends State<RegisterUserForm> {
  String? dropdownValue;
  final TabController tabController;
  // String? name;
  final GlobalKey<FormState> _formKeyUser = GlobalKey<FormState>();

  _RegisterUserFormState(this.tabController);

  @override
  Widget build(BuildContext context) {
    final listGender = <String>[
      S.of(context).gender_male, // male
      S.of(context).gender_female, // female
    ];
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoaded) {
          // date picker
          Future<void> _showDatePicker() async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime((DateTime.now().year - 18)),
              firstDate: DateTime(1900),
              lastDate: DateTime(DateTime.now().year - 18),
              locale: const Locale('es', 'ES'),
              // (2101)
            );
            // Date ->
            picked != null
                ? context.read<OnboardingBloc>().add(
                      UpdateUser(
                        user: state.user.copyWith(
                          dateOfBirth: Timestamp.fromDate(picked),
                        ),
                      ),
                    )
                : null;
          }

          return Center(
            child: Form(
              key: _formKeyUser,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //campo formulario NOMBRE
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: S.of(context).title_user_screen,
                      icon: const Icon(Icons.person),
                    ),
                    // validator: (name) => Validators.isNameValidator(name!),
                    onChanged: (value) {
                      context.read<OnboardingBloc>().add(
                            UpdateUser(user: state.user.copyWith(name: value)),
                          );
                      // name = value;
                    },
                  ),
                  // Genero
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text('Sexo'),
                      focusColor: Colors.pink,
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 45,
                      ),
                      elevation: 16,
                      style: const TextStyle(
                          color: Colors.deepPurple, fontSize: 18),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      underline: Container(
                        height: 2,
                        color: Colors.black12,
                      ),
                      // cambiar por tipo Categorias
                      items: listGender.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),

                      onChanged: (index) {
                        setState(() {
                          dropdownValue = index!;
                          context.read<OnboardingBloc>().add(UpdateUser(
                                user: state.user.copyWith(gender: index),
                              ));
                        });
                      },
                    ),
                  ),

                  // Intertar mas secciones

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
                          child: Text(S.of(context).bttn_date_birth),
                          onPressed: _showDatePicker,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(width: 25),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //
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
                      if (!_formKeyUser.currentState!.validate()) {
                        return;
                      }
                      tabController.animateTo(tabController.index + 1);
                    },
                  ),
                ],
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
