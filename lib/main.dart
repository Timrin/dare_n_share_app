import 'package:dare_n_share_app/controllers/dare_logic.dart';
import 'package:dare_n_share_app/models/colors.dart';
import 'package:dare_n_share_app/screens/dare_details_screen.dart';
import 'package:dare_n_share_app/screens/login_user.dart';
import 'package:dare_n_share_app/screens/register_user.dart';
import 'package:dare_n_share_app/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:dare_n_share_app/screens/home.dart';
import 'package:provider/provider.dart';

import 'controllers/controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider<Controller>.value(
      child: MaterialApp(
        title: 'Dare n Share',
        theme: ThemeData(
          primarySwatch: ColorDesign.colorAppbar,


        ),
        home: Home(), //TODO: if the user is not logged in show the authenticate screen
      ), value: Controller(),
    );
  }
}

