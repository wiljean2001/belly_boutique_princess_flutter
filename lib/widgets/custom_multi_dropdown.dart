import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

// import '../models/models.dart';
//
class CustomDropDown extends StatefulWidget {
  final List<MultiSelectItem> listItems;
  final GlobalKey<FormFieldState<dynamic>>? globalKey;
  final Function(List<Object?> values) onConfirm;
  final Text buttonText;
  final Widget title;

  const CustomDropDown({
    Key? key,
    required this.listItems,
    this.globalKey,
    required this.onConfirm,
    required this.buttonText,
    required this.title,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        MultiSelectDialogField(
            items: widget.listItems,
            onConfirm: (List<Object?> values) => widget.onConfirm(values),
            // validator: ,
            buttonText: widget.buttonText,
            buttonIcon: const Icon(Icons.keyboard_arrow_down_outlined),
            dialogHeight: widget.listItems.length * 55,
            // searchIcon: ,
            // key: widget.globalKey,
            title: widget.title),
      ],
    );
  }
}

//   return DropdownButton<String>(
//     hint: const Text('Categorias'),
//     isExpanded: true,
//     focusColor: Theme.of(context).primaryColor.withOpacity(.5),
//     value: dropdownValue,
//     icon: const Icon(
//       Icons.keyboard_arrow_down_outlined,
//       size: 45,
//     ),
//     elevation: 8,
//     style: Theme.of(context).textTheme.titleMedium,
//     borderRadius: const BorderRadius.all(Radius.circular(10)),
//     underline: Container(
//       height: 2,
//       color: Theme.of(context).primaryColorDark,
//     ),

//     // cambiar por tipo Categorias
//     // items: <String>['opcion1', 'opcion2', 'opcion3']
//     items: state.categories.map<DropdownMenuItem<String>>(
//       (Category value) {
//         return DropdownMenuItem<String>(
//             value: value.name, child: Text(value.name));
//       },
//     ).toList(),
//     onChanged: (String? index) {
//       setState(
//         () {
//           dropdownValue = index!;
//         },
//       );
//     },
//   );
