import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../generated/l10n.dart';
import '../models/models.dart';

class CustomDropDownCategories extends StatefulWidget {
  const CustomDropDownCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDropDownCategories> createState() =>
      _CustomDropDownCategoriesState();
}

class _CustomDropDownCategoriesState extends State<CustomDropDownCategories> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 250,
      height: 55,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoryLoaded) {
            return DropdownButton<String>(
              hint: const Text('Categorias'),
              isExpanded: true,
              focusColor: Theme.of(context).primaryColor.withOpacity(.5),
              value: dropdownValue,
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 45,
              ),
              elevation: 8,
              style: Theme.of(context).textTheme.titleMedium,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              underline: Container(
                height: 2,
                color: Theme.of(context).primaryColorDark,
              ),
              

              // cambiar por tipo Categorias
              // items: <String>['opcion1', 'opcion2', 'opcion3']
              items: state.categories.map<DropdownMenuItem<String>>(
                (Category value) {
                  return DropdownMenuItem<String>(
                      value: value.name, child: Text(value.name));
                },
              ).toList(),
              onChanged: (String? index) {
                setState(
                  () {
                    dropdownValue = index!;
                  },
                );
              },
            );
          }
          return Text(S.of(context).error_desc);
        },
      ),
    );
  }
}
