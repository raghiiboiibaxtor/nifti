import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/functions/functions.dart';

// ? ButtonSwitch == display toggle switch on button

// * ---------------- * (STATEFUL WIDGET) CLASS ButtonSwitch (STATEFUL WIDGET) * ---------------- *
class ButtonSwitch extends StatefulWidget {
  // Component Variables
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double width;
  final double height;
  final bool showSwitch;

  const ButtonSwitch({
    super.key,
    required this.text,
    this.color = const Color.fromRGBO(255, 255, 255, 1),
    this.fontSize = 13,
    this.fontWeight = FontWeight.w600,
    this.fontColor = const Color.fromRGBO(116, 142, 183, 1),
    this.icon = CupertinoIcons.add,
    this.iconColor = const Color.fromRGBO(116, 142, 183, 1),
    this.iconSize = 20,
    this.width = 360,
    this.height = 45,
    this.showSwitch = false,
  });
  
  @override
  State<ButtonSwitch> createState() => _ButtonSwitchState();
}
// * ---------------- * END OF (STATE) CLASS ButtonSwitch (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _ButtonSwitchState (STATE) * ---------------- *
class _ButtonSwitchState extends State<ButtonSwitch> {
  // ? Variables
  bool activated = true;

  // * * ---------------- * (BUILD WIDGET) * ---------------- *
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // Base shape
        Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1.0,
                  blurRadius: 2.0,
                  offset: const Offset(0, 0.5),
                ),
              ],
              color: niftiWhite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(1),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // ? Toggle Switch
                Row(
                  children: [
                    Switch(
                      value: activated,
                      activeColor: niftiDarkBlue,
                      trackOutlineWidth: MaterialStateProperty.all(0.5),
                      inactiveThumbColor: niftiGrey,
                      inactiveTrackColor: niftiGreyShadow,
                      trackOutlineColor: MaterialStateProperty.resolveWith(
                        (final Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return null;
                          }

                          return niftiGrey;
                        },
                      ),
                      onChanged: (bool value) {
                        // ! FaceID Logic here
                        if (value == true) {
                          NiftiSystemSettings.getFaceID();
                        }
                        // NiftiSystemSettings.getFaceID;
                        // Change appearance on toggle
                        setState(() {
                          activated = value;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            )),

        // Icon Shape
        Container(
          height: widget.height,
          width: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0.2,
                blurRadius: 1.0,
                offset: const Offset(0, .5),
              ),
            ],
            color: niftiWhite,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(1),
              bottomLeft: Radius.circular(17),
            ),
          ),
          child: Icon(
            widget.icon,
            color: widget.iconColor,
            size: widget.iconSize,
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 70,
            ),
            TextDisplay(
                text: widget.text,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                color: widget.fontColor),
          ],
        ),
      ],
    );
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATE) CLASS _ButtonSwitchState (STATE) * ---------------- *