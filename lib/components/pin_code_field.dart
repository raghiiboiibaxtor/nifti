import "package:flutter/material.dart";
import "package:nifti_locapp/components/app_theme.dart";

// * ---------------- * (STATEFUL WIDGET) CLASS PinBox (STATEFUL WIDGET) * ---------------- *
class PinBox extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool hasError;
  const PinBox({required this.textEditingController, required this.hasError, super.key});

// * ---------------- * END OF (STATEFUL WIDGET) CLASS PinBox (STATEFUL WIDGET) * ---------------- *

// * ---------------- * (STATELESS WIDGET) CLASS PinBox (STATELESS WIDGET) * ---------------- *

  // * ---------------- * (BUILD WIDGET) * ---------------- *
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 160,
      width: 150,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(193, 197, 203, .25),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        cursorColor: niftiGrey,
        cursorHeight: 75,
        cursorWidth: 1,
        controller: textEditingController,
        autofocus: true,
        keyboardType: TextInputType.number,
        maxLength: 1,       
        decoration: InputDecoration(
          counterText: "",
          // General border
          border: const OutlineInputBorder
          (  
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          // Selected Border
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: niftiLightBlue, width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          // Error border
          errorBorder:hasError ? OutlineInputBorder(
            borderSide: BorderSide(color: niftiPink, width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
          ) : const OutlineInputBorder(borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(      
            height: 1.42,
            fontFamily: 'Montserrat',
            color: niftiGrey,
            fontWeight: FontWeight.bold,
            fontSize: 85,
            ),      
        onChanged: (value) {
          // Focus to next field if number entered
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            // If the value is empty (backspace), move to the previous pin field
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATELESS WIDGET) CLASS PinBox (STATELESS WIDGET) * ---------------- *
