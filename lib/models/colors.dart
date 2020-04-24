import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Author Karolina Hammar
///This class will provide all colors that will be implemented to the design of the product.
///

class ColorDesign {
  ///Will prevent instance variable from this class
  ColorDesign._();

  static const Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    700: Color.fromRGBO(136, 14, 79, .7),
    800: Color.fromRGBO(136, 14, 79, .8),
    900: Color.fromRGBO(136, 14, 79, .9),
  };

  ///Colors for every page

  ///Right now colorBlue for home and profilePicture
  static const MaterialColor colorProfile = MaterialColor(0xffBAF1E4, color);

  ///Color for appbar
  static const MaterialColor colorAppbar = MaterialColor(0xff92B473, color);

  ///Color for big plus button
  static const MaterialColor colorHomeButton = MaterialColor(0xffD576E3, color);

  /// Colors for progressbar

  ///Color succeeded
  static const MaterialColor colorProgressSucceeded =
      MaterialColor(0xff85CC7F, color);

  ///Color not succeeded
  static const MaterialColor colorProgressFail =
      MaterialColor(0xffF47B7B, color);

  ///Color unfinished days of challenge
  static const MaterialColor colorProgressUncompleted =
  MaterialColor(0xffDADAD2, color);

  ///List will probably not be of use, but will be kept for the time being

 /* static const List<MaterialColor> designColors =  [
    colorProfile, colorAppbar, colorHomeButton, colorProgressSucceeded,
    colorProgressFail, colorProgressFail];
  */
}
