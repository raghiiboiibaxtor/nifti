import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/text_display.dart';

// ? ButtonComponent == custom button widget

// * ---------------- * (STATELESS WIDGET) CLASS ButtonComponent (STATELESS WIDGET) * ---------------- *
class Button extends StatelessWidget {
  // Component Variables
  final Function()? onTap;
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
  final bool showArrowIcon;

  // Required & optional variables to be passed
  const Button({
    super.key,
    required this.onTap,
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
    this.showArrowIcon = false,
  });

  // * ---------------- * (BUILD WIDGET) * ---------------- *
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Base shape
          Container(
              height: height,
              width: width,
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
                  // ? Arrow Icon
                  if (showArrowIcon == false)
                    // Empty Space
                    const SizedBox()
                  else
                    // ? Display arrow icon
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.forward,
                          semanticLabel: 'Open Page',
                          color: niftiGrey,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                ],
              )),

          // Icon Shape
          Container(
            height: height,
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
              icon,
              color: iconColor,
              size: iconSize,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextDisplay(
                  text: text,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: fontColor),
            ],
          ),
        ],
      ),
    );
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATELESS WIDGET) CLASS ButtonComponent (STATELESS WIDGET) * ---------------- *
