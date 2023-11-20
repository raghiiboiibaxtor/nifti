import 'package:flutter/material.dart';
import 'package:nifti_locapp/components/app_theme.dart';

// ? DropdownMenuComponent == Custom drop down menu

// * ---------------- * (STATELESS WIDGET) CLASS DropdownMenuComponent (STATELESS WIDGET) * ---------------- *
class DropdownMenuComponent extends StatelessWidget {
  // ? Component Variables
  final dynamic value;
  final double width;
  final List<String> itemsList;
  final String? labelText;
  final Function(dynamic value) onChanged;
  final String? savedValue;

  // ? Required variables to be passed
  const DropdownMenuComponent(
      {super.key,
      required this.value,
      required this.width,
      required this.itemsList,
      required this.labelText,
      required this.onChanged,
      this.savedValue});

  // * ---------------- * (BUILD WIDGET) * ---------------- *
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField<String>(
          value: savedValue,
          menuMaxHeight: 200,
          iconEnabledColor: niftiGrey,
          style: TextStyle(color: niftiGrey, fontSize: 13),
          borderRadius: BorderRadius.circular(20),
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 0),
            labelText: labelText,
              labelStyle: TextStyle(
                  color: niftiGrey, fontSize: 13, fontWeight: FontWeight.w500),
              floatingLabelStyle: TextStyle(
                  color: niftiGrey, fontSize: 13, fontWeight: FontWeight.w500),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: niftiGrey,
                width: 0.5,
              ),
            ),
            // ? Selected border style
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: niftiLightBlue,
                  width: 1.5,
                ),
              ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          items: itemsList
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                          color: niftiGrey,
                          fontSize: 13,
                          fontFamily: 'Montserrat'),
                    ),
                  ))
              .toList(),
          onChanged: (value) => onChanged(value)),
    );
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATELESS WIDGET) CLASS DropdownMenuComponent (STATELESS WIDGET) * ---------------- *
