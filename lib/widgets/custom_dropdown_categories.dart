import 'package:belly_boutique_princess/config/theme_default.dart';
import 'package:flutter/material.dart';

class CustomDropDownCategories extends StatefulWidget {
  const CustomDropDownCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDropDownCategories> createState() =>
      _CustomDropDownCategoriesState();
}

class _CustomDropDownCategoriesState extends State<CustomDropDownCategories> {
  String dropdownValue = 'Categorias';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
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
        style: Theme.of(context).textTheme.titleMedium,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        underline: Container(
          height: 2,
          color: Theme.of(context).primaryColorLight,
        ),

        // cambiar por tipo Categorias
        items: <String>['Categorias', 'opcion1', 'opcion2', 'opcion3']
            .map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
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
    );
  }
}
