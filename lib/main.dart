import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/wrapper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp()); //Mount MyApp as the root widget

///MyApp is the root widget of the entire widget tree
///MyApp builds a MaterialApp which will contain the rest of the app
///ThemeData for the app is declared here
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dare n Share',
      theme: ThemeData(
          primarySwatch: ColorDesign.colorSecondary,
          buttonColor: ColorDesign.colorPrimary,
          accentColor: ColorDesign.colorPrimary,
          scaffoldBackgroundColor: Colors.white,
          cardTheme: CardTheme(
            color: Colors.grey[200],
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          buttonTheme: ButtonThemeData(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            height: 48,

          )),
      home: Wrapper(),
    );
  }
}
