import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///@author Karolina Hammar
///This class will provide all colors that will be implemented to the design of the product.
///Read the MaterialColor class documentation to understand how to create colors
///and why the colors are created the way they are in this class.

class ColorDesign {
  ///Will prevent instance variable from this class
  ColorDesign._();

  ///To create map of color with different illuminate levels
  static const Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  ///Colors for every page

  ///Right now colorBlue for home and profilePicture
  static const MaterialColor colorProfile = const MaterialColor(
    0xFF7EFFDB,
    const <int, Color>{
      50: Color(0xFFF0FFFB),
      100: Color(0xFFD8FFF4),
      200: Color(0xFFBFFFED),
      300: Color(0xFFA5FFE6),
      400: Color(0xFF91FFE0),
      500: Color(0xFF7EFFDB), //Primary value
      600: Color(0xFF76FFD7),
      700: Color(0xFF6BFFD2),
      800: Color(0xFF61FFCD),
      900: Color(0xFF4EFFC4),
    },
  );

  static const MaterialAccentColor colorProfileAccent =
      const MaterialAccentColor(0xFFFFFFFF, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    400: Color(0xFFF4FFFB),
    700: Color(0xFFDAFFF2),
  }); //0xffBAF1E4

  ///Color for appbar
  static const MaterialColor colorAppbar = const MaterialColor(
    //0xff92B473
    0xFFFF9DB2,
    const <int, Color>{
      50: Color(0xFFFFF3F6),
      100: Color(0xFFFFE2E8),
      200: Color(0xFFFFCED9),
      300: Color(0xFFFFBAC9),
      400: Color(0xFFFFACBE),
      500: Color(0xFFFF9DB2), //Primary value
      600: Color(0xFFFF95AB),
      700: Color(0xFFFF8BA2),
      800: Color(0xFFFF8199),
      900: Color(0xFFFF6F8A),
    },
  );

  //Accent material color of the primary pink color used in the app
  static const MaterialAccentColor colorPrimaryAccent =
  const MaterialAccentColor(0xFFFFFFFF, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    700: Color(0xFFFFF7F9),
  });

  ///Color for big plus button
  static const MaterialColor colorHomeButton = const MaterialColor(
    //0xffD576E3
    0xFFFF9DB2,
    const <int, Color>{
      50: Color(0xFFFFF3F6),
      100: Color(0xFFFFE2E8),
      200: Color(0xFFFFCED9),
      300: Color(0xFFFFBAC9),
      400: Color(0xFFFFACBE),
      500: Color(0xFFFF9DB2), //Primary value
      600: Color(0xFFFF95AB),
      700: Color(0xFFFF8BA2),
      800: Color(0xFFFF8199),
      900: Color(0xFFFF6F8A),
    },
  );
//Purple  0xFFFF9DB2  0xffB693FE
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
