import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nifti_locapp/components/app_theme.dart';

// ? BackNavBar == nav bar on alternative pages unattached from the navbar

// * ---------------- * (STATELESS WIDGET) CLASS BackAppBar (STATELESS WIDGET) * ---------------- *
class BackAppBar extends StatelessWidget {
  const BackAppBar({super.key});
  // * ---------------- * (BUILD WIDGET) * ---------------- *
  @override
  Widget build(BuildContext context) {
    return AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(40))),
          // ? Appbar Theme
          iconTheme: CupertinoIconThemeData(color: niftiOffWhite, size: 23),
          elevation: 2,
          shadowColor: niftiGreyShadow,
          surfaceTintColor: niftiOffWhite,
          toolbarHeight: 40,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: niftiGradientSemiOpaque,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(40))),
          ),
          // ? Go Back
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              semanticLabel: 'Back',
            ),
          ),
          // ? Nifti Logo
          title: SizedBox(
            width: 70,
            child: Image.asset('images/nifti_logo_white.png'),
          ),
        );
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATELESS WIDGET) CLASS BackAppBar (STATELESS WIDGET) * ---------------- *