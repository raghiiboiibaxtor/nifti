import 'package:flutter/material.dart';

// APP COLOURS
LinearGradient niftiGradient = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color.fromRGBO(221, 148, 246, 1),
      Color.fromRGBO(115, 142, 247, 1),
      Color.fromRGBO(116, 215, 247, 1)
    ]);

LinearGradient niftiGradientSemiOpaque = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color.fromRGBO(221, 148, 246, .70),
      Color.fromRGBO(115, 142, 247, .70),
      Color.fromRGBO(116, 215, 247, .70)
    ]);

LinearGradient niftiGradientOpaque = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color.fromRGBO(221, 148, 246, .30),
      Color.fromRGBO(115, 142, 247, .30),
      Color.fromRGBO(116, 215, 247, .30)
    ]);

Color niftiPink = const Color.fromRGBO(221, 148, 246, 1);
Color niftiDarkBlue = const Color.fromRGBO(115, 142, 247, 1);
Color niftiLightBlue = const Color.fromRGBO(116, 215, 247, 1);
Color niftiWhite = const Color.fromRGBO(255, 255, 255, 1);
Color niftiOffWhite = const Color.fromRGBO(255, 254, 253, 1);
Color niftiGrey = const Color.fromRGBO(116, 142, 183, 1);
Color niftiGreyShadow = const Color.fromRGBO(116, 142, 183, 0.23);
Color niftiLightGrey = const Color.fromRGBO(193, 197, 203, 1);
Color niftiError = const Color.fromRGBO(255, 159, 180, 1);
Color niftiWhiteOpaque = const Color.fromRGBO(255, 255, 255, .30);